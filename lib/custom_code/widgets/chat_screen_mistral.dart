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

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat con Mistral',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SafeArea(
          child: ChatScreenMistral(
            width: 400,
            height: 600,
            apiUrl: '192.168.1.128:11430',
            apiUser: '',
            apiPass: '',
            userImagePath:
                'assets/user_avatar.png', // Ruta del avatar del usuario
            backgroundColor: Colors.grey, // Color de fondo
            headerColor: Colors.blue, // Color de la cabecera
            userBubbleColor: Colors.green, // Color del mensaje del usuario
            assistantBubbleColor:
                Colors.blue, // Color del mensaje del asistente
            progressIndicatorColor:
                Colors.purple, // Color del indicador de progreso
            textColor: Colors.white, // Color del texto
            headerTitle: 'Asistente Personalizado', // Título de la cabecera
            placeholderText:
                'Escribe aquí...', // Placeholder del campo de entrada
            connectionInfoText: 'Conectado a:', // Texto del diálogo de conexión
          ),
        ),
      ),
    );
  }
}

class ChatScreenMistral extends StatefulWidget {
  const ChatScreenMistral({
    super.key,
    this.width,
    this.height,
    required this.apiUrl,
    required this.apiUser,
    required this.apiPass,
    this.userImagePath, // Avatar del usuario
    this.backgroundColor = Colors.grey, // Color de fondo
    this.headerColor = Colors.blue, // Color de la cabecera
    this.userBubbleColor = Colors.blue, // Color del mensaje del usuario
    this.assistantBubbleColor = Colors.grey, // Color del mensaje del asistente
    this.progressIndicatorColor =
        Colors.blue, // Color del indicador de progreso
    this.textColor = Colors.white, // Color del texto
    this.headerTitle = 'Asistente Mistral', // Título de la cabecera
    this.placeholderText =
        'Escribe tu mensaje...', // Placeholder del campo de entrada
    this.connectionInfoText = 'Conectado a:', // Texto del diálogo de conexión
  });

  final double? width;
  final double? height;
  final String apiUrl;
  final String apiUser;
  final String apiPass;
  final String? userImagePath; // Avatar del usuario
  final Color backgroundColor; // Color de fondo
  final Color headerColor; // Color de la cabecera
  final Color userBubbleColor; // Color del mensaje del usuario
  final Color assistantBubbleColor; // Color del mensaje del asistente
  final Color progressIndicatorColor; // Color del indicador de progreso
  final Color textColor; // Color del texto
  final String headerTitle; // Título de la cabecera
  final String placeholderText; // Placeholder del campo de entrada
  final String connectionInfoText; // Texto del diálogo de conexión

  @override
  State<ChatScreenMistral> createState() => _ChatScreenMistralState();
}

class _ChatScreenMistralState extends State<ChatScreenMistral> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  ImageProvider? _getImageProvider(String? path) {
    if (path == null || path.isEmpty) return null;
    try {
      if (path.startsWith('http')) {
        return NetworkImage(path);
      } else {
        return AssetImage(path);
      }
    } catch (e) {
      debugPrint('Error cargando imagen: $e');
      return null;
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty || _isLoading) return;
    final message = _controller.text.trim();
    _controller.clear();
    setState(() {
      _messages.add({'text': message, 'isUser': true});
      _isLoading = true;
    });
    _scrollToBottom();
    try {
      final response = await http
          .post(
            Uri.parse('http://${widget.apiUrl}/api/generate'),
            headers: {
              'Authorization':
                  'Basic ${_encodeCredentials(widget.apiUser, widget.apiPass)}',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'model': 'mistral',
              'prompt': '[INST] $message [/INST]',
              'stream': false,
              'options': {'temperature': 0.7, 'max_tokens': 500, 'top_p': 0.9}
            }),
          )
          .timeout(const Duration(seconds: 60));
      final Map<String, dynamic> jsonResponse = _validateResponse(response);
      setState(() {
        _messages.add({
          'text': jsonResponse['response'] ?? 'Respuesta vacía',
          'isUser': false,
          'timestamp': DateTime.now()
        });
      });
    } on TimeoutException {
      _handleErrorWithRetry(
          'El modelo está tardando demasiado. ¿Quieres reintentar?');
    } catch (e) {
      _handleError(
          'Error: ${e.toString().replaceAll(RegExp(r'^Exception: '), '')}');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      _scrollToBottom();
    }
  }

  String _encodeCredentials(String user, String pass) {
    return base64Encode(utf8.encode('$user:$pass'));
  }

  Map<String, dynamic> _validateResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
    try {
      final json = jsonDecode(response.body);
      if (json is! Map<String, dynamic>) throw FormatException();
      return json;
    } catch (e) {
      throw FormatException('La respuesta no es un JSON válido');
    }
  }

  void _handleError(String error) {
    if (!mounted) return;
    setState(() {
      _messages.add({
        'text': error,
        'isUser': false,
        'isError': true,
        'timestamp': DateTime.now()
      });
    });
  }

  void _handleErrorWithRetry(String message) {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _sendMessage(); // Reintentar
            },
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Cabecera
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.headerColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(0)),
            ),
            child: Row(
              children: [
                const Icon(Icons.smart_toy, color: Colors.white, size: 24),
                const SizedBox(width: 10),
                Text(
                  widget.headerTitle,
                  style: TextStyle(color: widget.textColor, fontSize: 18),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.info, color: Colors.white),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Estado de conexión'),
                      content:
                          Text('${widget.connectionInfoText} ${widget.apiUrl}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Área de mensajes
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _ChatBubble(
                text: _messages[index]['text'],
                isUser: _messages[index]['isUser'],
                isError: _messages[index]['isError'] ?? false,
                userBubbleColor: widget.userBubbleColor,
                assistantBubbleColor: widget.assistantBubbleColor,
                textColor: widget.textColor,
                userAvatarPath: widget.userImagePath,
              ),
            ),
          ),
          // Área de entrada
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 44, 45, 51),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(0)),
            ),
            child: Column(
              children: [
                if (_isLoading)
                  LinearProgressIndicator(
                    backgroundColor: const Color.fromARGB(255, 129, 161, 13),
                    valueColor:
                        AlwaysStoppedAnimation(widget.progressIndicatorColor),
                    minHeight: 2,
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: widget.textColor),
                        decoration: InputDecoration(
                          hintText: widget.placeholderText,
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[800],
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: widget.progressIndicatorColor,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isError;
  final Color userBubbleColor;
  final Color assistantBubbleColor;
  final Color textColor;
  final String? userAvatarPath;

  const _ChatBubble({
    required this.text,
    this.isUser = false,
    this.isError = false,
    required this.userBubbleColor,
    required this.assistantBubbleColor,
    required this.textColor,
    this.userAvatarPath,
  });

  ImageProvider? _getImageProvider(String? path) {
    if (path == null || path.isEmpty) return null;
    try {
      if (path.startsWith('http')) {
        return NetworkImage(path);
      } else {
        return AssetImage(path);
      }
    } catch (e) {
      debugPrint('Error cargando imagen: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: isError ? Colors.red : Colors.blue[800],
                child: Icon(
                  isError ? Icons.error : Icons.smart_toy,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? userBubbleColor : assistantBubbleColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (isUser)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundImage: _getImageProvider(userAvatarPath),
                backgroundColor: Colors.transparent,
                child: userAvatarPath == null
                    ? const Icon(Icons.person, color: Colors.white, size: 18)
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}
