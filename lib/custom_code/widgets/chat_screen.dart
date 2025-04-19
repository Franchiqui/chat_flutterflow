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

import 'package:pocketbase/src/sse/sse_message.dart';
import 'package:open_file/open_file.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';
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
import 'dart:convert';
import 'dart:ui' as ui;

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

  Future<void> _initializeVideo() async {
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

class ChatScreen extends StatefulWidget {
  final bool isInvitacion;
  final String grupo; // Id del grupo
  final String nameGrupo; // Nombre del grupo
  final Future Function(bool? aceptada, String grupo, String nameGrupo)
      invitacion;

  const ChatScreen({
    super.key,
    this.width,
    this.height,
    required this.idChat,
    required this.username,
    required this.password,
    required this.text,
    required this.listaMensajes,
    this.isInvitacion = false,
    required this.grupo,
    required this.nameGrupo,
    required this.invitacion,
    required this.tono,
    required this.contenedorColor1,
    required this.contenedorColor2,
    required this.mensajeColor,
    required this.textFielColor,
    required this.textFielContainerColor,
    required this.user1,
    required this.user2,
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
  });

  final double? width;
  final double? height;
  final String idChat;
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
  final String user1;
  final String user2;
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

  @override
  State<ChatScreen> createState() => _ChatScreenState();
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
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final PdfViewerController _pdfController = PdfViewerController();
  bool _isDownloading = false;

  Future<void> _downloadFile() async {
    setState(() => _isDownloading = true);
    try {
      // 1. Lógica de descarga directa aquí
      final dir = await getDownloadsDirectory();
      final path = '${dir!.path}/${widget.documentName}';
      await Dio().download(widget.filePath, path);

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
      appBar: AppBar(
        title: Text(widget.documentName),
        actions: [
          _isDownloading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: _downloadFile,
                ),
        ],
      ),
      body: SfPdfViewer.file(
        File(widget.filePath),
        controller: _pdfController,
      ),
    );
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
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

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final PocketBase pb = PocketBase('https://pocketbase-chat.fly.dev');
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _downloadProgressController = StreamController<DownloadProgress>();

  late final Future Function(bool? view, String id) viewFile;
  bool _isSubscribed = false;
  bool _isAuthenticated = false;
  bool _isLoadingAudio = false;
  String? _currentlyLoadingUrl;
  List<RecordModel> messages = [];
  String? _currentAudioUrl;
  bool _isUpdatingMedia = false;
  VideoPlayerController? _videoPlayerController;

  Stream<DownloadProgress> get _downloadProgressStream =>
      _downloadProgressController.stream;

  var record;

  var _errorCount;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _marcarMensajesComoVistos();
    });
    _authenticateUser();
    _initializeRealtime();
    _verifyVideoUrl();
  }

  void _verifyVideoUrl() {
    if (widget.videoUrl.isNotEmpty) {
      debugPrint('✅ URL de video recibida: ${widget.videoUrl}');
      if (!_isValidUrl(widget.videoUrl)) {
        debugPrint('⛔ URL de video inválida!');
      }
    }
  }

  Future<void> _initializeRealtime() async {
    try {
      final wsUrl = 'wss://${Uri.parse(pb.baseURL).host}/api/realtime';

      // Reconectar automáticamente con nuevos headers
      await pb.realtime.connect(
        url: wsUrl,
        getHeaders: () => {'Authorization': pb.authStore.token}, // Token actual
      );

      pb.realtime.subscribe('mensajes', (e) {
        if (e.action == 'update') {
          final updatedRecord = e.record!;
          if (updatedRecord.getStringValue('idChat') == widget.idChat) {
            setState(() {
              final index =
                  messages.indexWhere((m) => m.id == updatedRecord.id);
              if (index != -1) {
                // Actualizar el registro completo
                messages[index] = RecordModel.fromJson({
                  ...messages[index].toJson(),
                  'data': {
                    ...messages[index].data,
                    'visto': updatedRecord.data['visto']
                  }
                });
              }
            });
          }
        }
      });

      // Resto del código de inicialización...
    } catch (e) {
      debugPrint('Error realtime: $e');
    }
  }

  bool _isValidUrl(String url) {
    try {
      return Uri.parse(url).isAbsolute;
    } catch (e) {
      return false;
    }
  }

  bool _invitationSent = false;

  @override
  void didUpdateWidget(ChatScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.username != oldWidget.username ||
        widget.password != oldWidget.password) {
      _resetRealtimeConnection();
    }

    if (widget.idChat != oldWidget.idChat ||
        widget.username != oldWidget.username ||
        widget.password != oldWidget.password) {
      _handleChatChange(
          widget.idChat); // Forzar recarga al cambiar usuario o chat
    }
    // Si es invitación y se activa enviar, mandar mensaje de invitación
    if (widget.isInvitacion && widget.enviar && !_invitationSent) {
      _sendInvitationMessage();
      _invitationSent = true;
    } else if (widget.enviar && !oldWidget.enviar) {
      if (widget.tipo == 'texto') {
        _sendTextMessage();
      } else if (widget.tipo == 'audio') {
        _sendAudioMessage();
      } else if (widget.tipo == 'audioVoz') {
        _sendAudioVozMessage();
      } else if (widget.tipo == 'archivo') {
        _sendFileMessage(); // Enviar archivos multimedia
      } else if (!_isUpdatingMedia && widget.mensajeId.isNotEmpty) {
        _handleMediaUpdate();
      }
    }
  }

  Future<void> _sendAudioMessage() async {
    try {
      // Verificar si la ruta del archivo está vacía
      if (widget.audioPath.isEmpty) {
        throw Exception('La ruta del archivo de audio está vacía');
      }

      // Detectar si es una URL válida o un archivo local
      final isUrl = widget.audioPath.startsWith('http');

      // Crear el mensaje en PocketBase
      final newMessage = await pb.collection('mensajes').create(
        body: {
          'user': pb.authStore.record!.id,
          'idChat': widget.idChat,
          'fechaMensaje': _formatTime(DateTime.now()),
          'imagenUrl': isUrl ? widget.audioPath : '', // URL si es remoto
          'audioLocal':
              !isUrl ? widget.audioPath : null, // Ruta local si no es URL
          'created': DateTime.now().toIso8601String(),
          'tipo': 'audio', // Tipo de mensaje
        },
      );

      // Manejar el nuevo mensaje
      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando archivo de audio: ${e.toString()}');
    }
  }

  Future<void> _handleChatChange(String newChatId) async {
    try {
      if (_isSubscribed) {
        await pb
            .collection('mensajes')
            .unsubscribe('*'); // Cancelar suscripción anterior
        _isSubscribed = false;
      }
      setState(() => messages.clear()); // Limpiar mensajes antiguos
      await _loadMessagesForChat(newChatId); // Cargar mensajes del nuevo chat
      await _subscribeToRealtimeForChat(newChatId); // Nueva suscripción
    } catch (e) {
      _showErrorSnackbar('Error cambiando de chat: $e');
    }
  }

  Future<void> _handleMediaUpdate() async {
    if (widget.mensajeId.isEmpty || widget.imageFile.isEmpty) return;

    setState(() => _isUpdatingMedia = true);

    try {
      final fieldToUpdate =
          widget.tipo == 'imagen' ? 'imagenUrl' : 'mensajeUrl';
      final updatedRecord = await pb.collection('mensajes').update(
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

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    try {
      // Liberar el controlador anterior si existe
      await _videoPlayerController?.dispose();

      // Verificar si la URL es válida
      if (videoUrl.isEmpty || !_isValidUrl(videoUrl)) {
        throw Exception('URL de video inválida');
      }

      // Crear nuevo controlador
      _videoPlayerController = VideoPlayerController.network(videoUrl)
        ..addListener(() {
          if (mounted) setState(() {});
        });

      // Inicializar el controlador
      await _videoPlayerController!.initialize();

      // Verificar si el widget sigue montado
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('🔥 Error al inicializar video: $e');

      // Incrementar el contador de errores
      if (_errorCount < 2) {
        _showErrorSnackbar('Error al cargar el video: ${e.toString()}');
        _errorCount++; // Incrementar el contador
      }
    }
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

  Future<void> _sendFileMessage() async {
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
        'user': pb.authStore.record!.id,
        'idChat': widget.idChat,
        'fechaMensaje': _formatTime(DateTime.now()),
        'imagenUrl': '${widget.videoUrl}?token=${pb.authStore.token}',
        'user1': widget.user1,
        'user2': widget.user2,
        'created': DateTime.now().toIso8601String(),
        'tipo': tipoArchivo,
      };

      // Agregar texto si existe
      if (widget.textoFile.isNotEmpty) {
        body['texto'] = widget.textoFile;
      }

      // Crear y manejar el nuevo mensaje
      final newMessage = await pb.collection('mensajes').create(body: body);
      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando archivo: ${e.toString()}');
    }
  }

  Future<void> _sendAudioVozMessage() async {
    try {
      // Verificar si es una URL válida o archivo local
      final isUrl = widget.audioPath.startsWith('http');
      final newMessage = await pb.collection('mensajes').create(
        body: {
          'user': pb.authStore.record!.id,
          'idChat': widget.idChat,
          'fechaMensaje': _formatTime(DateTime.now()),
          'mensajeUrl': isUrl ? widget.audioPath : '',
          'created': DateTime.now().toIso8601String(),
          'tipo': 'audioVoz',
          // Solo para audio local
          ...(!isUrl ? {'audioLocal': widget.audioPath} : {}),
        },
      );

      // No insertar manualmente el mensaje en la lista
      // setState(() {
      //   messages.insert(0, newMessage);
      // });

      // Notificar al padre (opcional, si es necesario)
      widget.listaMensajes(_formatMessages(messages));

      // Hacer scroll al fondo (opcional, si es necesario)
      _scrollToBottom();
    } catch (e) {
      _showErrorSnackbar('Error enviando audioVoz: ${e.toString()}');
    }
  }

  String _formatTime(DateTime date) {
    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _authenticateUser() async {
    try {
      await pb
          .collection('users')
          .authWithPassword(widget.username, widget.password);
      if (pb.authStore.record != null) {
        setState(() => _isAuthenticated = true);
        await _loadMessagesForChat(widget.idChat);
        await _resetRealtimeConnection(); // <-- Añadir esto
      }
    } catch (e) {
      _showErrorSnackbar('Error de autenticación: $e');
      Navigator.pop(context);
    }
  }

  Future<void> _resetRealtimeConnection() async {
    // Cancelar todas las suscripciones existentes
    if (_isSubscribed) {
      await pb.collection('mensajes').unsubscribe('*');
      _isSubscribed = false;
    }

    // Volver a inicializar la conexión
    await _initializeRealtime();
    await _subscribeToRealtimeForChat(widget.idChat);
  }

  Future<void> _saveFileUsingMediaStore(String fileUrl) async {
    try {
      // Obtener el nombre del archivo
      final fileName = fileUrl.split('/').last;

      // Descargar el archivo usando Dio
      final response = await Dio()
          .get(fileUrl, options: Options(responseType: ResponseType.bytes));

      // Obtener el directorio de descargas
      final directory = await getExternalStorageDirectory();
      final downloadsPath = '${directory!.path}/Download';
      await Directory(downloadsPath).create(recursive: true);

      // Guardar el archivo
      final filePath = '$downloadsPath/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.data);

      // Mostrar un mensaje de éxito
      _showSuccessSnackbar('Archivo guardado en: $filePath');
    } catch (e) {
      _showErrorSnackbar('Error al guardar el archivo: ${e.toString()}');
    }
  }

  Future<void> _handleDocumentTap(String url, String id, String name) async {
    final action = await showDialog<String>(
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
        await widget.descargar(true, id, name); // Solo callback
        break;
      case 'view':
        await _viewDocument(url, id, name); // Visor completo
        break;
    }
  }

  Future<void> _viewDocument(String url, String id, String name) async {
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

  Future<void> _viewTextFile(String filePath, String fileName) async {
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

  Future<void> _openWithExternalApp(String filePath) async {
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

  Future<String> _getFileInfo(String url) async {
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

  Future<void> _loadMessagesForChat(String newChatId) async {
    try {
      final response = await pb.collection('mensajes').getList(
            filter: 'idChat = "$newChatId"', // Usar el idChat actualizado
            sort: '-created',
            expand: 'user',
          );
      setState(() => messages = response.items);
    } catch (e) {
      _showErrorSnackbar('Error cargando mensajes: $e');
    }
    await _marcarMensajesComoVistos();
  }

  Future<void> _marcarMensajesComoVistos() async {
    try {
      final currentUserId = pb.authStore.record?.id;

      final mensajesNoVistos = messages.where((m) {
        final esMensajeRecibido = m.getStringValue('user') != currentUserId;
        final noEstaVisto = !(m.data['visto'] as bool? ?? false); // Corregido
        return esMensajeRecibido && noEstaVisto;
      }).toList();

      for (final msg in mensajesNoVistos) {
        final updatedMsg = await pb.collection('mensajes').update(
          msg.id,
          body: {'visto': true},
        );

        setState(() {
          final index = messages.indexWhere((m) => m.id == updatedMsg.id);
          if (index != -1) messages[index] = updatedMsg;
        });
      }
    } catch (e) {
      debugPrint('Error actualizando visto: $e');
    }
  }

  Future<void> _subscribeToRealtimeForChat(String newChatId) async {
    try {
      await pb.collection('mensajes').subscribe('*', (event) {
        if (event.action == 'create' || event.action == 'update') {
          final record = event.record;
          if (record != null && record.getStringValue('idChat') == newChatId) {
            setState(() {
              final index = messages.indexWhere((m) => m.id == record.id);
              if (index != -1) {
                messages[index] = record; // Actualizar el mensaje completo
              }
            });
          }
        }
      });

      _isSubscribed = true; // Marcar como suscrito
    } catch (e) {
      debugPrint('Error en suscripción realtime: $e');
      _showErrorSnackbar('Error en suscripción realtime: $e');
    }
  }

  List<dynamic> _formatMessages(List<RecordModel> messages) {
    return messages
        .map((message) => {
              'texto': message.data['texto'] ?? '',
              'mensajeUrl': message.data['mensajeUrl'] ?? '',
              'fechaMensaje': message.data['fechaMensaje'] ?? '',
              'imagenUrl': message.data['imagenUrl'] ?? '',
              'user1': message.data['user1'] ?? '',
              'user2': message.data['user2'] ?? '',
              'chatId': message.data['idChat'] ?? '',
              'tipo': message.data['tipo'] ?? '',
              'mensajeId': message.id,
              'visto': message.data['visto'] ?? false,
            })
        .toList();
  }

  Future<void> _sendTextMessage() async {
    if (widget.text.isEmpty || widget.text.trim().isEmpty) return;
    try {
      // Crear el mensaje en PocketBase
      final newMessage = await pb.collection('mensajes').create(
        body: {
          'user': pb.authStore.record!.id,
          'texto': widget.text,
          'idChat': widget.idChat,
          'fechaMensaje': _formatTime(DateTime.now()),
          'created': DateTime.now().toIso8601String(),
          'tipo': 'texto',
        },
      );

      // Verificar si el mensaje ya existe en la lista
      final exists = messages.any((m) => m.id == newMessage.id);
      if (!exists) {
        setState(() {
          messages.insert(0, newMessage);
        });
      }

      widget.listaMensajes(_formatMessages(messages));
      _scrollToBottom();

      debugPrint('📩 Mensaje enviado, esperando evento realtime...');
    } catch (e) {
      _showErrorSnackbar('Error enviando texto: $e');
    }
  }

// Añade este método en la clase _ChatScreenState
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
                      await pb.collection('mensajes').delete(message.id);
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

  @override
  void dispose() {
    _downloadProgressController.close();
    _audioPlayer.dispose();

    // Solo cancelar suscripciones (no usar disconnect)
    if (_isSubscribed) {
      pb.collection('mensajes').unsubscribe('*');
    }

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: _buildMessageList(),
            )
          ],
        ),
      ),
    );
  }

  // Enviar mensaje real de invitación
  Future<void> _sendInvitationMessage() async {
    try {
      final newMessage = await pb.collection('mensajes').create(
        body: {
          'user': pb.authStore.record!.id,
          'idChat': widget.idChat,
          'tipo': 'invitacion',
          'groupId': widget.grupo,
          'groupName': widget.nameGrupo,
          'inviterName': widget.username,
          'fechaMensaje': _formatTime(DateTime.now()),
          'created': DateTime.now().toIso8601String(),
        },
      );
      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando invitación: \\${e.toString()}');
    }
  }

  // Método para construir la burbuja según el tipo
  Widget _buildMediaBubble(RecordModel message) {
    final tipo = message.getStringValue('tipo');
    final url = tipo == 'documento'
        ? message.data['imagenUrl']
        : message.data['mensajeUrl'];

    return _buildDocumentPreview(url, message); // Pasa ambos argumentos
  }

  Widget _buildMessageList() {
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

          // Validar que el mensaje tenga datos válidos
          if (message.data == null || message.data.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Mensaje inválido',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

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
                  message.getStringValue('user') == pb.authStore.record?.id),
            ],
          );
        },
      ),
    );
  }

  Color _getTimestampColor(String tipo) {
    switch (tipo) {
      case 'imagen':
        return widget.fechaImagenColor
            .withValues(); // Usar el color específico para imágenes
      case 'audio':
        return widget.fechaAudioColor.withValues();
      case 'audioVoz':
        return widget.fechaAudioVozColor.withValues();
      case 'texto':
      default:
        return widget.fechaTipoColor
            .withValues(); // Usar el color específico para texto
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
                  FutureBuilder<String>(
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
    final messageId = message.id;

    // Colores específicos para cada tipo de mensaje
    Color bubbleColor = Colors.transparent;
    if (tipo == 'audioVoz') {
      bubbleColor = Colors.grey[300]!;
    }
    if (tipo == 'invitacion') {
      return _buildInvitationBubble(message, isMe);
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

    if (tipo == 'imagen') {
      return buildBubble(
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                              color: (message.data['visto'] as bool? ?? false)
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
                              color: (message.data['visto'] as bool? ?? false)
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
                          color: (message.data['visto'] as bool? ?? false)
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

    // Mensajes de texto
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
                    color: (message.data['visto'] as bool? ?? false)
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

  Widget _buildInvitationBubble(RecordModel message, bool isMe) {
    // Usar los datos del mensaje si existen, si no, usar los del widget
    final groupName = message.data['groupName'] ?? widget.nameGrupo;
    final inviterName = message.data['inviterName'] ?? widget.username;

    return GestureDetector(
      onTap: () => _showInvitationOptions(context, message),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🎉 Invitación a Grupo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text("Has sido invitado al grupo '$groupName' por $inviterName"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.invitacion(false, widget.grupo, widget.nameGrupo);
                    _handleInvitationResponse(message, false);
                  },
                  child: const Text(
                    'Rechazar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    widget.invitacion(true, widget.grupo, widget.nameGrupo);
                    _handleInvitationResponse(message, true);
                  },
                  child: const Text('Unirse'),
                ),
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

  Future<void> _sendGroupInvitation(String groupId, String groupName) async {
    try {
      final newMessage = await pb.collection('mensajes').create(
        body: {
          'user': pb.authStore.record!.id,
          'idChat': widget.idChat,
          'tipo': 'invitacion',
          'groupId': groupId,
          'groupName': groupName,
          'inviterName': pb.authStore.record!.data['username'],
          'fechaMensaje': _formatTime(DateTime.now()),
          'created': DateTime.now().toIso8601String(),
        },
      );
      _handleNewMessage(newMessage);
    } catch (e) {
      _showErrorSnackbar('Error enviando invitación: ${e.toString()}');
    }
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

  Widget _buildVideoPlayer(String videoUrl) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.end, // Alinea la fecha a la derecha
      mainAxisSize: MainAxisSize.min,
      children: [
        // Contenedor del video (sin bordes)
        ClipRRect(
          borderRadius:
              BorderRadius.circular(8), // Bordes ligeramente redondeados
          child: _VideoPreview(
              url: videoUrl), // Usa el reproductor que ya funciona
        ),
        // Contenedor de la fecha (igual que en las imágenes)
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 8),
          child: Text(
            _formatTime(
                DateTime.now()), // Reemplaza con la fecha real del mensaje
            style: TextStyle(
              color: widget
                  .fechaImagenColor, // Usa el color definido para imágenes
              fontSize: widget.mensajeFontSize * 0.8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      height: 150,
      color: Colors.grey[800],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 40),
            SizedBox(height: 8),
            Text('Error al cargar el video',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
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
        StreamBuilder<Duration>(
          stream: _audioPlayer.onPositionChanged,
          builder: (context, positionSnapshot) {
            final currentPosition = positionSnapshot.data ?? Duration.zero;
            return StreamBuilder<Duration>(
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
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

  Widget _buildAudioVozMessage(RecordModel message) {
    final audioUrl = message.data['mensajeUrl'] ?? '';
    final fileName = audioUrl.split('/').last;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.music_note, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Archivo de audio',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => _toggleAudio(audioUrl, false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageMessage(RecordModel message) {
    final imageUrl = message.data['imagenUrl'] ?? '';
    if (imageUrl.isEmpty || !_isValidUrl(imageUrl)) {
      return Container(
        width: 260,
        height: 240,
        color: Colors.grey[300],
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _showExpandedImage(context, imageUrl),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 260,
              height: 240,
              placeholder: (context, url) => Container(
                width: 260,
                height: 240,
                color: Colors.grey[300],
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: 260,
                height: 240,
                color: Colors.grey[300],
                child: Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 8),
          child: Text(
            message.data['fechaMensaje'] ?? '',
            style: TextStyle(
                fontSize: widget.mensajeFontSize, color: Colors.yellow[600]),
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showErrorSnackbar('No se pudo abrir el documento');
    }
  }

  Future<void> _toggleAudio(String url, bool isPlaying,
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
    // Verificar si el mensaje pertenece al chat actual
    if (newMessage.getStringValue('idChat') != widget.idChat) return;

    setState(() {
      final existingIndex = messages.indexWhere((m) => m.id == newMessage.id);

      if (existingIndex != -1) {
        // Actualizar mensaje existente
        messages[existingIndex] = newMessage;
      } else {
        // Insertar nuevo mensaje al principio
        messages.insert(0, newMessage);
      }
    });

    widget.listaMensajes(_formatMessages(messages));
    _scrollToBottom();

    // Marcar mensajes recibidos como vistos
    _marcarMensajesComoVistos();

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

  Future<void> _playNotificationSound() async {
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

  VideoPlayer(VideoPlayerController videoPlayerController) {}

  void _showSuccessSnackbar(String s) {}
}

class _handleInvitationResponse {
  _handleInvitationResponse(RecordModel message, bool bool);
}

class _showInvitationOptions {
  _showInvitationOptions(BuildContext context, RecordModel message);
}

extension on SseMessage {
  get action => null;

  get record => null;
}

mixin documentoId {}

extension on RealtimeService {
  connect(
      {required String url,
      required Map<String, String> Function() getHeaders}) {}
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
