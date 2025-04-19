// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets
import 'package:pocketbase/src/sse/sse_message.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:async';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:isolate';

class _VideoPreview extends StatefulWidget {
  final String url;
  const _VideoPreview({required this.url});

  @override
  State<_VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<_VideoPreview> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _showControls = false;
  bool _isFullScreen = false;
  final PocketBase pb = PocketBase('https://pocketbase-chat.fly.dev');
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      if (!mounted) return;
      setState(() {});
    };
    _initializeVideo();
  }

  Future _initializeVideo() async {
    try {
      if (widget.url.isEmpty) throw Exception('URL vacía');
      final authUrl = '${widget.url}?token=${pb.authStore.token}';
      debugPrint('🔄 URL de video con autenticación: $authUrl');

      _controller = VideoPlayerController.network(
        authUrl,
        httpHeaders: {
          'Authorization': pb.authStore.token,
          'Cache-Control': 'no-cache'
        },
      )..addListener(_listener);

      await _controller.initialize();
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('🔥 Error crítico: ${e.toString()}');
      if (mounted) _showErrorSnackbar('Error cargando video: ${e.toString()}');
    }
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      _showControls = true;
    });
    _hideControlsAfterDelay();
  }

  void _toggleFullScreen(BuildContext context) {
    if (_isFullScreen) {
      Navigator.of(context).pop();
      setState(() => _isFullScreen = false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: _buildVideoPlayer(fullScreen: true),
            ),
          ),
        ),
      ).then((_) => setState(() => _isFullScreen = false));
      setState(() => _isFullScreen = true);
    }
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() => _showControls = false);
      }
    });
  }

  Widget _buildControls() {
    return AnimatedOpacity(
      opacity: _showControls ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Barra superior con botón de pantalla completa
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: () => _toggleFullScreen(context),
                ),
              ],
            ),
            // Botón central de play/pause
            Center(
              child: IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: _togglePlayPause,
              ),
            ),
            // Barra de progreso
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer({bool fullScreen = false}) {
    return AspectRatio(
      aspectRatio: fullScreen
          ? MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height
          : _controller.value.aspectRatio,
      child: GestureDetector(
        onTap: () {
          setState(() => _showControls = !_showControls);
          if (_showControls) _hideControlsAfterDelay();
        },
        child: Stack(
          fit: fullScreen ? StackFit.expand : StackFit.loose,
          children: [
            VideoPlayer(_controller),
            if (_showControls || !_controller.value.isPlaying) _buildControls(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Container(
        height: 150,
        color: Colors.transparent,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    return _buildVideoPlayer();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String filePath;
  final String documentId;
  final String documentName;
  final Function(bool) onDownload;

  const PdfViewerScreen({
    required this.filePath,
    required this.documentId,
    required this.documentName,
    required this.onDownload,
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State {
  final PdfViewerController _pdfController = PdfViewerController();
  bool _isDownloading = false;

  Future _downloadFile() async {
    setState(() => _isDownloading = true);
    try {
      // 1. Lógica de descarga directa aquí
      final dir = await getDownloadsDirectory();
      final path = '${dir!.path}/${widget.documentName}';

      // 2. Notificar al padre (opcional)
      widget.onDownload(true);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Descargado en: $path')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isDownloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.documentName), actions: [
      _isDownloading
          ? const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            )
          : IconButton(
              icon: const Icon(Icons.download),
              onPressed: _downloadFile,
            ),
    ]));
  }
}

extension on StatefulWidget {
  get documentName => null;

  void onDownload(bool bool) {}
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 4 + _controller.value * 8,
              height: 16 + _controller.value * 8,
              color: Colors.blue,
            ),
            SizedBox(width: 4),
            Container(
              width: 4 + _controller.value * 12,
              height: 12 + _controller.value * 12,
              color: Colors.green,
            ),
            SizedBox(width: 4),
            Container(
              width: 4 + _controller.value * 10,
              height: 10 + _controller.value * 10,
              color: Colors.red,
            ),
          ],
        );
      },
    );
  }
}

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({
    super.key,
    this.width,
    this.height,
    required this.groupId,
    required this.username,
    required this.password,
    required this.text,
    required this.listaMensajes,
    required this.tono,
    required this.contenedorColor1,
    required this.contenedorColor2,
    required this.mensajeColor,
    required this.textFielColor,
    required this.textFielContainerColor,
    required this.members,
    required this.groupName,
    required this.enviar,
    required this.onNewMessageReceived,
    required this.audioPath,
    required this.textoFile,
    required this.isFile,
    required this.imageFile,
    required this.viewFile,
    required this.tipo,
    required this.mensajeId,
    required this.mensajeFontSize,
    required this.videoUrl,
    required this.imageUrl,
    required this.fechaImagenColor,
    required this.fechaTipoColor,
    required this.fechaAudioColor,
    required this.descargar,
    required this.fechaAudioVozColor,
    this.iconInfoGrupo,
    this.filePath,
    required this.groupAvatarUrl,
  });

  final double? width;
  final double? height;
  final String groupId;
  final String username;
  final String password;
  final String text;
  final Future Function(List<dynamic> mensaje) listaMensajes;
  final String tono;
  final Color contenedorColor1;
  final Color contenedorColor2;
  final Color mensajeColor;
  final Color textFielColor;
  final Color textFielContainerColor;
  final List<dynamic> members;
  final String groupName;
  final bool enviar;
  final Future Function(bool tono) onNewMessageReceived;
  final String audioPath;
  final String textoFile;
  final bool isFile;
  final String imageFile;
  final Future Function(bool? view, String id) viewFile;
  final String tipo;
  final String mensajeId;
  final double mensajeFontSize;
  final String videoUrl;
  final String imageUrl;
  final Color fechaImagenColor;
  final Color fechaTipoColor;
  final Color fechaAudioColor;
  final Future Function(
      bool documento, String documentoId, String documentoName) descargar;
  final Color fechaAudioVozColor;
  final Widget? iconInfoGrupo;
  final String? filePath;
  final String groupAvatarUrl;

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final PocketBase pb = PocketBase('https://pocketbase-chat.fly.dev');
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _downloadProgressController = StreamController();
  late final Future Function(bool? view, String id) viewFile;
  bool _isSubscribed = false;
  bool _isAuthenticated = false;
  bool _isAuthenticating =
      false; // Added variable to track authentication state
  bool _isLoadingAudio = false;
  String? _currentlyLoadingUrl;
  List messages = [];
  String? _currentAudioUrl;
  bool _isUpdatingMedia = false;
  VideoPlayerController? _videoPlayerController;
  // Información del grupo
  List groupMembers = [];
  String groupAvatarUrl = '';
  int _errorCount = 0;

  Stream get _downloadProgressStream => _downloadProgressController.stream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _marcarMensajesComoVistos();
    });
    _authenticateUser();
    _initializeRealtime();
    _loadGroupInfo();
    _verifyVideoUrl();
    _createOrUpdateGroup();
    _subscribeToGrupos(); // Suscribirse a cambios en la colección "grupos"
  }

  Future _loadGroupInfo() async {
    if (widget.groupId.isEmpty) {
      debugPrint('⚠️ Grupo ID vacío - omitiendo carga');
      return;
    }

    try {
      final groupRecord = await pb.collection('grupos').getOne(widget.groupId);

      setState(() {
        // Acceder al campo Miembros como List<Map<String, dynamic>>
        if (groupRecord.data.containsKey('Miembros')) {
          groupMembers =
              List<Map<String, dynamic>>.from(groupRecord.data['Miembros']);
        } else if (widget.members.isNotEmpty) {
          groupMembers = widget.members;
        }

        // Obtener URL del avatar del grupo si existe
        groupAvatarUrl = groupRecord.getStringValue('avatar');
      });
    } catch (e) {
      debugPrint('🔥 Error cargando grupo: ${e.toString()}');
    }
  }

  void _verifyVideoUrl() {
    if (widget.videoUrl.isNotEmpty) {
      debugPrint('✅ URL de video recibida: ${widget.videoUrl}');
      if (!_isValidUrl(widget.videoUrl)) {
        debugPrint('⛔ URL de video inválida!');
      }
    }
  }

  Future _initializeRealtime() async {
    try {
      final wsUrl = 'wss://${Uri.parse(pb.baseURL).host}/api/realtime';
      await pb.realtime.connect(
        url: wsUrl,
        getHeaders: () => {'Authorization': pb.authStore.token},
      );
      await _cleanOldSubscriptions();
      await _subscribeToRealtimeForGroup(widget.groupId);
    } catch (e) {
      debugPrint('Error realtime: $e');
    }
  }

  Future _cleanOldSubscriptions() async {
    try {
      await pb.realtime.send({
        'clientId': pb.authStore.clientId,
        'action': 'unsubscribe',
        'subscriptions': ['group_messages', 'group_messages/*']
      });
    } catch (e) {
      debugPrint('Error limpiando suscripciones: $e');
    }
  }

  Future _subscribeToRealtimeForGroup(String groupId) async {
    try {
      await pb.collection('group_messages').subscribe('*', (event) {
        if (event.action == 'create' || event.action == 'update') {
          final record = event.record;
          if (record != null && record.getStringValue('grupo') == groupId) {
            setState(() {
              final index = messages.indexWhere((m) => m.id == record.id);
              if (index != -1) {
                messages[index] = record; // Actualizar mensaje existente
              } else {
                messages.insert(0, record); // Insertar nuevo mensaje
              }
            });
            widget.listaMensajes(_formatMessages(messages));
            _scrollToBottom();
          }
        }
      });
      _isSubscribed = true;
    } catch (e) {
      debugPrint('Error en suscripción realtime: $e');
      _showErrorSnackbar('Error en suscripción realtime: $e');
    }
  }

  Future _subscribeToGrupos() async {
    await pb.collection('grupos').subscribe('*', (e) {
      if (e.action == 'update' && e.record?.id == widget.groupId) {
        // Actualizar información del grupo
        _loadGroupInfo();
      }
    });
  }

  bool _isValidUrl(String url) {
    try {
      return Uri.parse(url).isAbsolute;
    } catch (e) {
      return false;
    }
  }

  @override
  void didUpdateWidget(GroupChatScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.groupId != oldWidget.groupId ||
        widget.username != oldWidget.username ||
        widget.password != oldWidget.password) {
      _handleGroupChange(widget.groupId);
    }

    if (widget.enviar && !oldWidget.enviar) {
      if (widget.tipo == 'texto') {
        _sendTextMessage();
      } else if (widget.tipo == 'audio') {
        _sendAudioMessage();
      } else if (widget.tipo == 'audioVoz') {
        _sendAudioVozMessage();
      } else if (widget.tipo == 'archivo') {
        _sendFileMessage();
      } else if (!_isUpdatingMedia && widget.mensajeId.isNotEmpty) {
        _handleMediaUpdate();
      }
    }
  }

  Future _handleGroupChange(String newGroupId) async {
    try {
      if (_isSubscribed) {
        await pb.collection('group_messages').unsubscribe('*');
        _isSubscribed = false;
      }
      setState(() => messages.clear());
      await _loadMessagesForGroup(newGroupId);
      await _loadGroupInfo();
      await _subscribeToRealtimeForGroup(newGroupId);
    } catch (e) {
      _showErrorSnackbar('Error cambiando de grupo: $e');
    }
  }

  Future _sendAudioMessage() async {
    try {
      if (widget.audioPath.isEmpty) {
        throw Exception('La ruta del archivo de audio está vacía');
      }

      // Detectar si es una URL válida o un archivo local
      final isUrl = widget.audioPath.startsWith('http');

      // Crear el mensaje en PocketBase
      final newMessage = await pb.collection('group_messages').create(
        body: {
          'user': pb.authStore.model!.id,
          'grupo': widget.groupId, // Usar relation para PocketBase
          'fechaMensaje': _formatTime(DateTime.now()),
          'imagenUrl': isUrl ? widget.audioPath : '',
          'audioLocal': !isUrl ? widget.audioPath : null,
          'created': DateTime.now().toIso8601String(),
          'tipo': 'audio',
        },
      );

      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando archivo de audio: ${e.toString()}');
    }
  }

  Future _handleMediaUpdate() async {
    if (widget.mensajeId.isEmpty || widget.imageFile.isEmpty) return;

    setState(() => _isUpdatingMedia = true);

    try {
      final fieldToUpdate =
          widget.tipo == 'imagen' ? 'imagenUrl' : 'mensajeUrl';

      final updatedRecord = await pb.collection('group_messages').update(
        widget.mensajeId,
        body: {
          fieldToUpdate: widget.imageFile,
          'updated': DateTime.now().toIso8601String(),
        },
      );

      _updateMessageInList(updatedRecord);
    } catch (e) {
      _showErrorSnackbar('Error actualizando archivo: ${e.toString()}');
    } finally {
      setState(() => _isUpdatingMedia = false);
    }
  }

  void _updateMessageInList(RecordModel updatedRecord) {
    setState(() {
      final index = messages.indexWhere((m) => m.id == updatedRecord.id);
      if (index != -1) {
        messages[index] = updatedRecord;
      } else {
        messages.insert(0, updatedRecord);
      }
    });

    widget.listaMensajes(_formatMessages(messages));
    _scrollToBottom();
  }

  String _detectarTipoArchivo(String url) {
    if (url.isEmpty) return 'desconocido';

    final extensionesImagen = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
    final extensionesAudio = ['.mp3', '.wav', '.ogg', '.m4a'];
    final extensionesAudioVoz = ['.mp3', '.wav', '.ogg', '.m4a'];
    final extensionesVideo = ['.mp4', '.mov', '.avi', '.mkv', '.webm'];
    final extensionesDocumento = ['.pdf', '.doc', '.docx', '.txt', '.rtf'];

    final urlLower = url.toLowerCase();

    if (extensionesImagen.any((ext) => urlLower.contains(ext))) {
      return 'imagen';
    } else if (extensionesAudio.any((ext) => urlLower.contains(ext))) {
      return 'audio';
    } else if (extensionesAudioVoz.any((ext) => urlLower.contains(ext))) {
      return 'audioVoz';
    } else if (extensionesVideo.any((ext) => urlLower.contains(ext))) {
      return 'video';
    } else if (extensionesDocumento.any((ext) => urlLower.contains(ext))) {
      return 'documento';
    } else {
      return 'desconocido';
    }
  }

  Future _sendFileMessage() async {
    try {
      final fileUrl =
          widget.videoUrl.isNotEmpty ? widget.videoUrl : widget.imageUrl;

      // Validación de URL vacía
      if (fileUrl.isEmpty) {
        throw Exception('La URL del archivo está vacía');
      }

      // Detectar tipo de archivo
      final tipoArchivo = _detectarTipoArchivo(fileUrl);

      // Crear cuerpo del mensaje
      final body = {
        'user': pb.authStore.model!.id,
        'grupo': widget.groupId, // Usar relation para PocketBase
        'fechaMensaje': _formatTime(DateTime.now()),
        'imagenUrl': '${widget.videoUrl}?token=${pb.authStore.token}',
        'created': DateTime.now().toIso8601String(),
        'tipo': tipoArchivo,
      };

      // Agregar texto si existe
      if (widget.textoFile.isNotEmpty) {
        body['texto'] = widget.textoFile;
      }

      // Crear y manejar el nuevo mensaje
      final newMessage =
          await pb.collection('group_messages').create(body: body);
      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando archivo: ${e.toString()}');
    }
  }

  Future _sendAudioVozMessage() async {
    try {
      // Verificar si es una URL válida o archivo local
      final isUrl = widget.audioPath.startsWith('http');

      final newMessage = await pb.collection('group_messages').create(
        body: {
          'user': pb.authStore.model!.id,
          'grupo': widget.groupId, // Usar relation para PocketBase
          'fechaMensaje': _formatTime(DateTime.now()),
          'mensajeUrl': isUrl ? widget.audioPath : '',
          'created': DateTime.now().toIso8601String(),
          'tipo': 'audioVoz',
          // Solo para audio local
          ...(!isUrl ? {'audioLocal': widget.audioPath} : {}),
        },
      );

      widget.listaMensajes(_formatMessages(messages));
      _scrollToBottom();
    } catch (e) {
      _showErrorSnackbar('Error enviando audioVoz: ${e.toString()}');
    }
  }

  String _formatTime(DateTime date) {
    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future _authenticateUser() async {
    try {
      setState(() => _isAuthenticating = true); // Estado de carga

      // 1. Ejecutar autenticación
      await pb
          .collection('users')
          .authWithPassword(widget.username, widget.password);

      // 2. Verificar autenticación exitosa
      if (pb.authStore.record == null || pb.authStore.token.isEmpty) {
        throw Exception('Token no recibido');
      }

      // 3. Actualizar estado y cargar datos
      setState(() => _isAuthenticated = true);

      // 4. Iniciar funciones dependientes de autenticación
      await _initializeRealtime();
      await _loadMessagesForGroup(widget.groupId);
      await _loadGroupInfo();
    } catch (e) {
      // 5. Manejo de errores
      setState(() => _isAuthenticated = false);
      debugPrint('🔥 Error de autenticación: ${e.toString()}');
      _showErrorSnackbar('Error de acceso: Verifica tus credenciales');
    } finally {
      // 6. Finalizar estado de carga
      setState(() => _isAuthenticating = false);
    }
  }

  // Método para ver documentos
  Future _handleDocumentTap(String url, String id, String name) async {
    final action = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Opciones'),
        content: Text('Acción para "$name"?'),
        actions: [
          TextButton(
            child: const Text('Descargar'),
            onPressed: () => Navigator.pop(context, 'download'),
          ),
          TextButton(
            child: const Text('Ver'),
            onPressed: () => Navigator.pop(context, 'view'),
          ),
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context, 'cancel'),
          ),
        ],
      ),
    );

    switch (action) {
      case 'download':
        await widget.descargar(true, id, name);
        break;
      case 'view':
        await _viewDocument(url, id, name);
        break;
    }
  }

  Future _viewDocument(String url, String id, String name) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileExtension = name.split('.').last.toLowerCase();
      final tempPath = '${tempDir.path}/$name';

      // Descargar el archivo
      await Dio().download(
        url,
        tempPath,
        options: Options(headers: {'Authorization': pb.authStore.token}),
      );

      if (!mounted) return;

      // Navegar al visor apropiado según la extensión
      switch (fileExtension) {
        case 'pdf':
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfViewerScreen(
                  filePath: tempPath,
                  documentId: id,
                  documentName: name,
                  onDownload: (bool doc) => widget.descargar(doc, id, name),
                ),
              ));
          break;
        case 'txt':
          await _viewTextFile(tempPath, name);
          break;
        case 'doc':
        case 'docx':
          await _openWithExternalApp(tempPath);
          break;
        default:
          await _openWithExternalApp(tempPath);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Future _viewTextFile(String filePath, String fileName) async {
    try {
      final file = File(filePath);

      // Primero intentamos con UTF-8
      String content;
      try {
        content = await file.readAsString();
      } catch (e) {
        // Si falla UTF-8, intentamos con Latin1 (ISO-8859-1)
        try {
          final bytes = await file.readAsBytes();
          content = latin1.decode(bytes);
        } catch (e) {
          // Si también falla Latin1, mostramos un mensaje
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se pudo leer el archivo de texto')),
          );
          return;
        }
      }

      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(fileName),
              actions: [
                IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () => widget.descargar(true, '', fileName),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: SelectableText(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al leer el archivo: ${e.toString()}')),
      );
    }
  }

  Future _openWithExternalApp(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo abrir el archivo')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al abrir el archivo: ${e.toString()}')),
      );
    }
  }

  Future _getFileInfo(String url) async {
    try {
      // 1. Obtener metadata del archivo (tamaño real)
      final response = await Dio().head(
        url,
        options: Options(
          headers: {'Authorization': pb.authStore.token},
        ),
      );

      final contentLength = int.tryParse(
            response.headers.value('content-length') ?? '0',
          ) ??
          0;

      // 2. Obtener extensión y tipo
      final fileName = _getFileNameFromUrl(url);
      final fileExt = fileName.split('.').last.toLowerCase();

      // 3. Formatear tamaño legible
      String formattedSize;
      if (contentLength < 1024) {
        formattedSize = '$contentLength B';
      } else if (contentLength < 1048576) {
        formattedSize = '${(contentLength / 1024).toStringAsFixed(1)} KB';
      } else {
        formattedSize = '${(contentLength / 1048576).toStringAsFixed(1)} MB';
      }

      // 4. Mapear tipos de archivo
      final fileTypes = {
        'pdf': 'Documento PDF',
        'doc': 'Documento Word',
        'docx': 'Documento Word',
        'xls': 'Hoja de cálculo Excel',
        'xlsx': 'Hoja de cálculo Excel',
        'ppt': 'Presentación PowerPoint',
        'pptx': 'Presentación PowerPoint',
        'txt': 'Archivo de texto',
        'zip': 'Archivo comprimido',
        'rar': 'Archivo comprimido',
      };

      return '${fileTypes[fileExt] ?? fileExt.toUpperCase()} • $formattedSize';
    } catch (e) {
      debugPrint('Error obteniendo metadata: $e');
      return 'Documento';
    }
  }

  Future _loadMessagesForGroup(String groupId) async {
    try {
      final response = await pb.collection('group_messages').getList(
            filter: 'grupo = "$groupId"', // Usar el campo relation
            sort: '-created',
            expand: 'user',
          );

      setState(() {
        messages = response.items;
        _scrollToBottom();
      });
      // Notificar al widget padre con la lista de mensajes formateada
      widget.listaMensajes(_formatMessages(messages));
      debugPrint('📩 Mensajes cargados: ${messages.length}');
    } catch (e) {
      _showErrorSnackbar('Error cargando mensajes: $e');
    }
    print('Cargando mensajes para grupo: ${widget.groupId}');
    final response = await pb.collection('group_messages').getList(
          filter: 'grupo = "${widget.groupId}"',
          sort: '-created',
          expand: 'user',
        );
    print('Respuesta de PB: ${response.items.length} mensajes');
  }

  Future _marcarMensajesComoVistos() async {
    try {
      final mensajesNoVistos = messages
          .where((m) =>
              m.getStringValue('user') != pb.authStore.model?.id &&
              m.data['visto'] != true)
          .toList();

      for (final msg in mensajesNoVistos) {
        await pb
            .collection('group_messages')
            .update(msg.id, body: {'visto': true});
      }
    } catch (e) {
      debugPrint('Error actualizando visto: $e');
    }
  }

  List _formatMessages(List messages) {
    return messages
        .map((message) => {
              'id': message.id,
              'texto': message.data['texto'] ?? '',
              'mensajeUrl': message.data['mensajeUrl'] ?? '',
              'fechaMensaje': message.data['fechaMensaje'] ?? '',
              'imagenUrl': message.data['imagenUrl'] ?? '',
              'grupoId': message.data['grupo'] ?? '', // Para chats grupales
              'tipo': message.data['tipo'] ?? '',
              'mensajeId': message.id,
              'visto': message.data['visto'] ?? false,
            })
        .toList();
  }

  Future<void> _createOrUpdateGroup() async {
    try {
      final body = {
        'nombre': widget.groupName,
        'avatar': groupAvatarUrl,
        'Miembros': groupMembers, // Lista de objetos JSON
      };

      if (widget.groupId.isEmpty) {
        // Crear un nuevo grupo
        await pb.collection('grupos').create(body: body);
      } else {
        // Actualizar un grupo existente
        await pb.collection('grupos').update(widget.groupId, body: body);
      }
    } catch (e) {
      _showErrorSnackbar('Error guardando grupo: $e');
    }
  }

  Future _sendTextMessage() async {
    if (widget.text.isEmpty || widget.text.trim().isEmpty) return;

    try {
      // Crear el mensaje en PocketBase
      final newMessage = await pb.collection('group_messages').create(body: {
        'user': pb.authStore.model!.id,
        'texto': widget.text,
        'grupoId': widget.groupId,
        'fechaMensaje': _formatTime(DateTime.now()),
        'created': DateTime.now().toIso8601String(),
        'tipo': 'texto',
      });

      // Verificar si el mensaje ya existe en la lista
      final exists = messages.any((m) => m.id == newMessage.id);
      if (!exists) {
        setState(() {
          messages.insert(0, newMessage);
        });
      }

      // Notificar al widget padre con la lista actualizada
      widget.listaMensajes(_formatMessages(messages));
      _scrollToBottom();
      debugPrint('📩 Mensaje enviado, esperando evento realtime...');
    } catch (e) {
      _showErrorSnackbar('Error enviando texto: $e');
    }
  }

  void _showMessageOptions(
      BuildContext context, RecordModel message, bool isMe) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Borrar para mí'),
                onTap: () {
                  Navigator.pop(context);
                  setState(
                      () => messages.removeWhere((m) => m.id == message.id));
                  widget.listaMensajes(_formatMessages(messages));
                },
              ),
              if (isMe)
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: const Text('Borrar para todos'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      await pb.collection('group_messages').delete(message.id);
                      setState(() =>
                          messages.removeWhere((m) => m.id == message.id));
                      widget.listaMensajes(_formatMessages(messages));
                    } catch (e) {
                      _showErrorSnackbar(
                          'Error borrando mensaje: ${e.toString()}');
                    }
                  },
                ),
              ListTile(
                leading: const Icon(Icons.cancel, color: Colors.grey),
                title: const Text('Cancelar'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  // Nuevo: Mostrar detalles del grupo
  void _showGroupDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.groupName),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (groupAvatarUrl.isNotEmpty)
                CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(groupAvatarUrl),
                ),
              const SizedBox(height: 16),
              const Text(
                'Miembros:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...groupMembers.map((member) => ListTile(
                    leading: member['avatar'] != null
                        ? CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(member['avatar']),
                          )
                        : null,
                    title: Text(member['nombre']),
                    subtitle: Text(member['id']),
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _downloadProgressController.close();
    _audioPlayer.dispose();
    _videoPlayerController?.dispose();

    if (_isSubscribed) {
      pb.collection('group_messages').unsubscribe('*');
      pb.collection('grupos').unsubscribe('*');
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAuthenticating) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_isAuthenticated) {
      return Center(child: Text('Autenticación requerida'));
    }

    // Verificación MOVIDA aquí (después de autenticación, antes de mensajes)
    if (widget.groupId.isEmpty) {
      return Scaffold(
        // Mantener Scaffold para estructura visual completa
        body: Center(
          child: Text(
            'ID de grupo inválido',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }

    if (messages.isEmpty) {
      return Center(child: Text('No hay mensajes'));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height ?? MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: _buildMessageList(),
                ),
              ],
            ),
          ),

          // Icono de información del grupo (solo si groupId es válido)
          if (widget.iconInfoGrupo != null)
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 10,
              child: GestureDetector(
                onTap: _showGroupDetails,
                child: widget.iconInfoGrupo!,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    // Añadir estados de carga y autenticación
    if (!_isAuthenticated) {
      return Center(child: Text('Autenticación requerida'));
    }

    if (messages.isEmpty) {
      return Center(child: Text('No hay mensajes'));
    }

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        overscroll: false,
      ),
      child: ListView.builder(
        reverse: true,
        controller: _scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          // Validación mejorada de mensajes
          if (message.data == null ||
              message.data.isEmpty ||
              message.data['created'] == null) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Mensaje corrupto',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          try {
            final messageDate = DateTime.parse(message.data['created']);
            final currentSeparator = _getDaySeparator(messageDate);

            String? previousSeparator;
            if (index < messages.length - 1) {
              final prevDate =
                  DateTime.parse(messages[index + 1].data['created']);
              previousSeparator = _getDaySeparator(prevDate);
            }

            return Column(
              children: [
                if (previousSeparator != currentSeparator)
                  _buildDateSeparator(currentSeparator),
                _buildMessageBubble(message,
                    message.getStringValue('user') == pb.authStore.model?.id),
              ],
            );
          } catch (e) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Formato de fecha inválido',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }

  Color _getTimestampColor(String tipo) {
    switch (tipo) {
      case 'imagen':
        return widget.fechaImagenColor.withOpacity(0.7);
      case 'audio':
        return widget.fechaAudioColor.withOpacity(0.7);
      case 'audioVoz':
        return widget.fechaAudioVozColor.withOpacity(0.7);
      case 'texto':
      default:
        return widget.fechaTipoColor.withOpacity(0.7);
    }
  }

  Widget _buildDocumentPreview(String documentUrl, RecordModel message) {
    final fileName = _getFileNameFromUrl(documentUrl);

    return GestureDetector(
      onTap: () => _handleDocumentTap(documentUrl, message.id, fileName),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFileIcon(fileName),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _truncateFileNameWithExtension(fileName),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FutureBuilder(
                    future: _getFileInfo(documentUrl),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? 'Cargando...',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(RecordModel message, bool isMe) {
    final tipo = message.data['tipo'] ?? _inferirTipo(message);
    final hasText = (message.data['texto'] ?? '').isNotEmpty;
    final timestamp = message.data['fechaMensaje'] ?? '';

    // Obtener información del usuario
    final userName = message.expand?['user']?.data['nombre'] ?? 'Anónimo';

    // Colores específicos para cada tipo de mensaje
    Color bubbleColor = Colors.transparent;
    if (tipo == 'audioVoz') {
      bubbleColor = Colors.grey[300]!;
    } else if (tipo == 'audio') {
      bubbleColor = Colors.blue[200]!;
    } else {
      bubbleColor = isMe ? widget.contenedorColor1 : widget.contenedorColor2;
    }

    // Función común para construir el GestureDetector
    Widget buildBubble(Widget child) {
      return GestureDetector(
        onLongPress: () => _showMessageOptions(context, message, isMe),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: child,
          ),
        ),
      );
    }

    // Mostrar nombre del usuario solo para los mensajes recibidos en chats grupales
    Widget buildUserNameHeader() {
      return !isMe
          ? Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.mensajeFontSize * 0.9,
                  color: Colors.blue[700],
                ),
              ),
            )
          : SizedBox.shrink();
    }

    if (tipo == 'imagen') {
      return buildBubble(
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildUserNameHeader(),
              GestureDetector(
                onTap: () =>
                    _showExpandedImage(context, message.data['imagenUrl']),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    message.data['imagenUrl'],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  left: isMe ? 0 : 8,
                  right: isMe ? 8 : 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      Text(
                        timestamp,
                        style: TextStyle(
                          color: widget.fechaImagenColor,
                          fontSize: widget.mensajeFontSize * 0.8,
                        ),
                      ),
                    if (isMe)
                      Row(
                        children: [
                          Text(
                            timestamp,
                            style: TextStyle(
                              color: widget.fechaImagenColor,
                              fontSize: widget.mensajeFontSize * 0.8,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.done_all,
                              size: 14,
                              color: (message.data['visto'] == true)
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (tipo == 'video') {
      return buildBubble(
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildUserNameHeader(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Video'),
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        body: Center(
                          child: _VideoPreview(url: message.data['imagenUrl']),
                        ),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: _VideoPreview(url: message.data['imagenUrl']),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  left: isMe ? 0 : 8,
                  right: isMe ? 8 : 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      Text(
                        timestamp,
                        style: TextStyle(
                          color: widget.fechaImagenColor,
                          fontSize: widget.mensajeFontSize * 0.8,
                        ),
                      ),
                    if (isMe)
                      Row(
                        children: [
                          Text(
                            timestamp,
                            style: TextStyle(
                              color: widget.fechaImagenColor,
                              fontSize: widget.mensajeFontSize * 0.8,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.done_all,
                              size: 14,
                              color: (message.data['visto'] == true)
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (tipo == 'documento') {
      return Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(
            top: 25,
            left: isMe ? 40 : 8,
            right: isMe ? 8 : 40,
            bottom: 25,
          ),
          decoration: BoxDecoration(
            color: isMe ? widget.contenedorColor1 : widget.contenedorColor2,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: buildUserNameHeader(),
                ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: _buildDocumentPreview(
                  message.data['imagenUrl'],
                  message,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: isMe ? 0 : 8,
                  right: isMe ? 8 : 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.data['fechaMensaje'] ?? '',
                      style: TextStyle(
                        color: widget.fechaTipoColor,
                        fontSize: widget.mensajeFontSize * 0.8,
                      ),
                    ),
                    if (isMe)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.done_all,
                          size: 14,
                          color: (message.data['visto'] == true)
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Mensajes de texto, audio y audioVoz
    return buildBubble(
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildUserNameHeader(),

            if (tipo == 'audio' || tipo == 'audioVoz')
              _buildAdvancedAudioPlayer(
                tipo == 'audio'
                    ? message.data['imagenUrl'] ?? ''
                    : message.data['mensajeUrl'] ?? '',
                message,
              ),

            if (hasText && tipo == 'texto')
              Text(
                message.data['texto'],
                style: TextStyle(
                  color: widget.mensajeColor,
                  fontSize: widget.mensajeFontSize,
                ),
              ),

            // Fecha y visto con alineación dinámica
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                // Mensajes recibidos (izquierda)
                if (!isMe) ...[
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: _getTimestampColor(tipo),
                      fontSize: widget.mensajeFontSize * 0.8,
                    ),
                  ),
                ],

                // Mensajes enviados (derecha)
                if (isMe) ...[
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: _getTimestampColor(tipo),
                      fontSize: widget.mensajeFontSize * 0.8,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 14,
                    color: (message.data['visto'] == true)
                        ? Colors.blue
                        : Colors.white,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileIcon(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    final icons = {
      'pdf': Icons.picture_as_pdf,
      'doc': Icons.description,
      'docx': Icons.description,
      'xls': Icons.table_chart,
      'xlsx': Icons.table_chart,
      'ppt': Icons.slideshow,
      'pptx': Icons.slideshow,
      'txt': Icons.text_snippet,
      'zip': Icons.folder_zip,
      'rar': Icons.folder_zip,
    };

    return Icon(
      icons[ext] ?? Icons.insert_drive_file,
      color: _getFileIconColor(ext),
      size: 28,
    );
  }

  Color _getFileIconColor(String extension) {
    final colors = {
      'pdf': Colors.red,
      'doc': Colors.blue,
      'docx': Colors.blue,
      'xls': Colors.green,
      'xlsx': Colors.green,
      'ppt': Colors.orange,
      'pptx': Colors.orange,
      'zip': Colors.yellow,
      'rar': Colors.yellow,
      'txt': Colors.purple,
    };

    return colors[extension] ?? Theme.of(context).primaryColor;
  }

  String _getFileNameFromUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.pathSegments.last;
    } catch (e) {
      debugPrint('Error al extraer el nombre del archivo: $e');
      return 'archivo_desconocido';
    }
  }

  String _truncateFileNameWithExtension(String fileName, {int maxLength = 20}) {
    final extension = fileName.split('.').last;
    final baseName = fileName.replaceAll('.$extension', '');

    if (baseName.length + extension.length + 1 <= maxLength) {
      return fileName; // No es necesario truncar
    }

    final truncatedBase =
        baseName.substring(0, maxLength - extension.length - 3);
    return '$truncatedBase...$extension';
  }

  String _inferirTipo(RecordModel message) {
    if ((message.data['mensajeUrl']?.isNotEmpty ?? false) &&
        (message.data['tipo'] == 'audioVoz')) {
      return 'audioVoz';
    }
    if ((message.data['imagenUrl']?.isNotEmpty ?? false) &&
        (message.data['tipo'] == 'audio')) {
      return 'audio';
    }
    if ((message.data['imagenUrl']?.isNotEmpty ?? false) &&
        (message.data['tipo'] == 'imagen')) {
      return 'imagen';
    }
    if ((message.data['imagenUrl']?.isNotEmpty ?? false) &&
        (message.data['tipo'] == 'video')) {
      return 'video';
    }
    if ((message.data['imagenUrl']?.isNotEmpty ?? false) &&
        (message.data['tipo'] == 'documento')) {
      return 'documento';
    }
    if ((message.data['texto']?.isNotEmpty ?? false)) {
      return 'texto';
    }
    return 'desconocido'; // Valor predeterminado si no se puede inferir
  }

  void _showExpandedImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 3,
          initialScale: PhotoViewComputedScale.contained,
          basePosition: Alignment.center,
          enableRotation: true,
          backgroundDecoration: BoxDecoration(color: Colors.black),
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                value: event?.cumulativeBytesLoaded.toDouble() ?? 0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(Icons.error, color: Colors.white, size: 50),
          ),
          heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
        ),
      ),
    );
  }

  Widget _buildAdvancedAudioPlayer(String audioUrl, RecordModel message) {
    final isVoiceMessage = message.data['tipo'] == 'audioVoz';
    final isCurrentAudio = _currentAudioUrl == audioUrl;
    final isLoading = _isLoadingAudio && _currentlyLoadingUrl == audioUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra de progreso
        StreamBuilder(
          stream: _audioPlayer.onPositionChanged,
          builder: (context, positionSnapshot) {
            final currentPosition = positionSnapshot.data ?? Duration.zero;
            return StreamBuilder(
              stream: _audioPlayer.onDurationChanged,
              builder: (context, durationSnapshot) {
                final totalDuration = durationSnapshot.data ?? Duration.zero;
                return Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 6),
                        activeTrackColor: Colors.black.withOpacity(0.8),
                        inactiveTrackColor: Colors.black.withOpacity(0.3),
                        thumbColor: Colors.black,
                      ),
                      child: Slider(
                        value: isCurrentAudio
                            ? currentPosition.inMilliseconds.toDouble()
                            : 0,
                        min: 0,
                        max: totalDuration.inMilliseconds > 0
                            ? totalDuration.inMilliseconds.toDouble()
                            : 100,
                        onChanged: isCurrentAudio
                            ? (value) async {
                                await _audioPlayer.seek(
                                  Duration(milliseconds: value.toInt()),
                                );
                              }
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(isCurrentAudio
                                ? currentPosition
                                : Duration.zero),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            _formatDuration(totalDuration),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),

        // Controles de reproducción
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            // Botón de retroceso (10 segundos)
            IconButton(
              icon: Icon(Icons.replay_10, size: 28),
              color: Colors.black,
              onPressed: isCurrentAudio && !isLoading
                  ? () async {
                      final currentPos =
                          await _audioPlayer.getCurrentPosition();
                      if (currentPos != null) {
                        final newPos = currentPos - Duration(seconds: 10);
                        await _audioPlayer.seek(
                            newPos > Duration.zero ? newPos : Duration.zero);
                      }
                    }
                  : null,
            ),

            // Botón principal de reproducción
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.2),
              ),
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        isCurrentAudio &&
                                _audioPlayer.state == PlayerState.playing
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 36,
                      ),
                      color: Colors.black,
                      onPressed: isLoading
                          ? null
                          : () => _toggleAudio(
                                audioUrl,
                                isCurrentAudio &&
                                    _audioPlayer.state == PlayerState.playing,
                                isVoiceMessage: isVoiceMessage,
                              ),
                    ),
            ),

            // Botón de avance (10 segundos)
            IconButton(
              icon: Icon(Icons.forward_10, size: 28),
              color: Colors.black,
              onPressed: isCurrentAudio && !isLoading
                  ? () async {
                      final currentPos =
                          await _audioPlayer.getCurrentPosition();
                      final duration = await _audioPlayer.getDuration();
                      if (currentPos != null && duration != null) {
                        final newPos = currentPos + Duration(seconds: 10);
                        await _audioPlayer
                            .seek(newPos < duration ? newPos : duration);
                      }
                    }
                  : null,
            ),
          ],
        ),

        // Indicador de tipo de audio
        if (isVoiceMessage)
          Center(
            child: Text(
              'Mensaje de voz',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future _toggleAudio(String url, bool isPlaying,
      {bool isVoiceMessage = false}) async {
    try {
      setState(() {
        _isLoadingAudio = true;
        _currentlyLoadingUrl = url;
      });

      if (isPlaying) {
        await _audioPlayer.pause();
        return;
      }

      if (_currentAudioUrl != url) {
        await _audioPlayer.stop();

        if (isVoiceMessage) {
          await _audioPlayer.setPlayerMode(PlayerMode.mediaPlayer);
          await _audioPlayer.setReleaseMode(ReleaseMode.stop);
        }

        await _audioPlayer.setSourceUrl(url);
        _currentAudioUrl = url;
      }

      await _audioPlayer.resume();
    } catch (e) {
      debugPrint('Error al reproducir audio: $e');
      _showErrorSnackbar('No se pudo reproducir el audio');
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingAudio = false;
          _currentlyLoadingUrl = null;
        });
      }
    }
  }

  String _getDaySeparator(DateTime messageDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDay =
        DateTime(messageDate.year, messageDate.month, messageDate.day);

    if (messageDay == today) return 'Hoy';
    if (messageDay == yesterday) return 'Ayer';
    return '${messageDay.day}/${messageDay.month}/${messageDay.year}';
  }

  Widget _buildDateSeparator(String separatorText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            separatorText,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _handleNewMessage(RecordModel newMessage) {
    if (newMessage.getStringValue('grupo') != widget.groupId) return;

    setState(() {
      final existingIndex = messages.indexWhere((m) => m.id == newMessage.id);
      if (existingIndex != -1) {
        messages[existingIndex] = newMessage; // Actualizar mensaje existente
      } else {
        messages.insert(0, newMessage); // Insertar nuevo mensaje
      }
    });

    // Notificar al widget padre con la lista actualizada
    widget.listaMensajes(_formatMessages(messages));
    _scrollToBottom();

    if (newMessage.getStringValue('user') != pb.authStore.model?.id) {
      _playNotificationSound();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future _playNotificationSound() async {
    try {
      await _audioPlayer.play(
        widget.tono.startsWith('http')
            ? UrlSource(widget.tono)
            : AssetSource(widget.tono),
      );
    } catch (e) {
      debugPrint('Error en sonido: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}

extension on AuthStore {
  get clientId => null;
}

extension on List<RecordModel>? {
  get data => null;
}

// Extensiones y utilidades

extension on SseMessage {
  get payload => null;
  get action => null;
  get record => null;
}

extension on RealtimeService {
  connect({required String url, required Map Function() getHeaders}) {}
  send(Map map) {}
}

extension on Color {
  get fontSize => null;
}

class DownloadProgress {
  final double progress;
  final int received;
  final int total;

  DownloadProgress(this.progress, this.received, this.total);
}
