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

import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:sound_stream/sound_stream.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class AudioRecorderScreen extends StatefulWidget {
  const AudioRecorderScreen({
    super.key,
    this.width,
    this.height,
    required this.accionRec,
    required this.accionStop,
    required this.size,
    required this.color,
    required this.id,
    required this.baseUrl,
    required this.coleccion,
    required this.campoAudio,
    required this.authToken,
  });

  final double? width;
  final double? height;
  final Future Function(bool accion1) accionRec;
  final Future Function(bool accion2, String url) accionStop;
  final double size;
  final Color color;
  final String id;
  final String baseUrl;
  final String coleccion;
  final String campoAudio;
  final String authToken;

  @override
  State<AudioRecorderScreen> createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  late RecorderStream _recorderStream;
  bool _isRecording = false;
  String? _audioPath;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _recorderStream = RecorderStream();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    try {
      await _recorderStream.initialize();
      _isInitialized = true;
    } catch (e) {
      print("Error inicializando grabador: $e");
    }
  }

  Future<void> _requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Se requiere acceso al micrófono para grabar audio"),
        ),
      );
      throw Exception('Permiso denegado');
    }
  }

  List<int> _createWavHeader(int dataLength) {
    final byteData = ByteData(44);
    // RIFF chunk
    byteData.setUint8(0, 0x52); // 'R'
    byteData.setUint8(1, 0x49); // 'I'
    byteData.setUint8(2, 0x46); // 'F'
    byteData.setUint8(3, 0x46); // 'F'
    byteData.setUint32(4, dataLength + 36, Endian.little); // Tamaño total
    byteData.setUint8(8, 0x57); // 'W'
    byteData.setUint8(9, 0x41); // 'A'
    byteData.setUint8(10, 0x56); // 'V'
    byteData.setUint8(11, 0x45); // 'E'
    // fmt chunk
    byteData.setUint8(12, 0x66); // 'f'
    byteData.setUint8(13, 0x6D); // 'm'
    byteData.setUint8(14, 0x74); // 't'
    byteData.setUint8(15, 0x20); // ' '
    byteData.setUint32(16, 16, Endian.little); // Tamaño sub-chunk
    byteData.setUint16(20, 1, Endian.little); // Formato PCM
    byteData.setUint16(22, 1, Endian.little); // Canales mono
    byteData.setUint32(24, 16000, Endian.little); // Sample rate
    byteData.setUint32(28, 32000, Endian.little); // Byte rate
    byteData.setUint16(32, 2, Endian.little); // Alineación
    byteData.setUint16(34, 16, Endian.little); // Bits por muestra
    // data chunk
    byteData.setUint8(36, 0x64); // 'd'
    byteData.setUint8(37, 0x61); // 'a'
    byteData.setUint8(38, 0x74); // 't'
    byteData.setUint8(39, 0x61); // 'a'
    byteData.setUint32(40, dataLength, Endian.little); // Tamaño datos

    return byteData.buffer.asUint8List();
  }

  @override
  void dispose() {
    _recorderStream.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (_isRecording || !_isInitialized) return;

    try {
      await _requestMicrophonePermission();
      final tempDir = await getTemporaryDirectory();
      _audioPath =
          '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.wav';

      final file = File(_audioPath!);
      final sink = file.openWrite();

      // Escribir cabecera inicial con tamaño 0
      sink.add(_createWavHeader(0));

      var audioData = <int>[];
      _recorderStream.audioStream.listen(
        (data) {
          audioData.addAll(data);
          sink.add(data);
        },
        onDone: () async {
          await sink.close();

          // Actualizar cabecera con tamaño real
          final header = _createWavHeader(audioData.length);
          final updatedFile = await file.readAsBytes();
          updatedFile.setRange(0, 44, header);
          await file.writeAsBytes(updatedFile);
        },
      );

      await _recorderStream.start();
      setState(() => _isRecording = true);
      await widget.accionRec(true);
    } catch (e) {
      print("Error al iniciar grabación: $e");
      setState(() => _isRecording = false);
      await widget.accionRec(false);
    }
  }

  Future<void> _stopAndUpload() async {
    if (!_isRecording) return;

    // Cambio instantáneo del estado antes de procesar
    setState(() => _isRecording = false);

    try {
      await _stopRecording();
      await _uploadAudio();
    } catch (e) {
      print("Error al detener grabación: $e");
      await widget.accionStop(false, "");
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorderStream.stop();

      if (_audioPath != null) {
        final file = File(_audioPath!);
        final bytes = await file.readAsBytes();

        // Calcular tamaño real de los datos de audio
        final dataSize = bytes.length - 44;

        // Generar encabezado con el tamaño correcto
        final updatedHeader = _createWavHeader(dataSize);

        // Reconstruir archivo con encabezado válido
        final updatedBytes = [...updatedHeader, ...bytes.sublist(44)];
        await file.writeAsBytes(updatedBytes);
      }
    } catch (e) {
      print("Error al finalizar grabación: $e");
      rethrow;
    }
  }

  Future<void> _uploadAudio() async {
    File? file;

    try {
      if (_audioPath == null) return;

      file = File(_audioPath!);
      final bytes = await file.readAsBytes();

      // Verificar cabecera WAV
      if (bytes.length < 44 ||
          String.fromCharCodes(bytes.sublist(0, 4)) != 'RIFF') {
        throw Exception('Archivo WAV corrupto');
      }

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${widget.baseUrl}/api/collections/${widget.coleccion}/records'),
      )
        ..files.add(http.MultipartFile.fromBytes(
          widget.campoAudio,
          bytes,
          filename: 'audio.wav',
          contentType: MediaType.parse('audio/wav'),
        ))
        ..fields['id'] = widget.id;

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(responseBody);
        final fileName = jsonResponse[widget.campoAudio];
        final audioUrl =
            '${widget.baseUrl}/api/files/${widget.coleccion}/${widget.id}/$fileName';
        await widget.accionStop(true, audioUrl);
      } else {
        throw Exception('Error ${response.statusCode}: $responseBody');
      }
    } catch (e) {
      print("Error en subida: $e");
      rethrow;
    } finally {
      if (file != null && await file.exists()) {
        await file.delete();
      }
      setState(() => _audioPath = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startRecording(),
      onTapUp: (_) => _stopAndUpload(),
      onTapCancel: _stopAndUpload,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          _isRecording ? Icons.stop_circle : Icons.mic,
          size: widget.size,
          color: _isRecording ? Colors.red : widget.color,
        ),
      ),
    );
  }
}

class MediaType {
  static parse(mimeType) {}
}
