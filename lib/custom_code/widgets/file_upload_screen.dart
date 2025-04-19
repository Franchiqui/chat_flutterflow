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

import 'package:file_picker/file_picker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({
    super.key,
    this.width,
    this.height,
    required this.baseUrl,
    required this.collectionId,
    required this.recordId,
    required this.adminToken,
    required this.fileFieldName,
    this.textColor2,
    this.textColor,
    this.buttonTextColor,
    this.buttonColor,
    this.enviarFile,
    required this.user,
    required this.user1,
    required this.user2,
    this.idChat,
    required this.fechaMensaje,
    this.groupId,
    this.groupName,
  });

  final double? width;
  final double? height;
  final String baseUrl;
  final String collectionId;
  final String recordId;
  final String adminToken;
  final String fileFieldName;
  final Color? textColor2;
  final Color? textColor;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final Future Function(bool file, String recordId, String fileName,
      String pocketBaseFileName, String? type)? enviarFile;
  final String user;
  final String user1;
  final String user2;
  final String? idChat;
  final String fechaMensaje;
  final String? groupId;
  final String? groupName;

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  late PocketBase pb;
  PlatformFile? selectedFile;
  String status = "Selecciona un archivo";
  bool isLoading = false;

  late bool uploadSuccess;

  @override
  void initState() {
    super.initState();
    pb = PocketBase(widget.baseUrl);
    pb.authStore.save(widget.adminToken, null);
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          selectedFile = result.files.first;
          status = "Archivo listo: ${selectedFile!.name}";
        });
      }
    } catch (e) {
      setState(() => status = "Error: $e");
    }
  }

  Future<void> uploadFile() async {
    if (selectedFile == null) return;

    setState(() => isLoading = true);

    try {
      // Validar que al menos uno de los campos esté presente
      if ((widget.idChat?.isEmpty ?? true) &&
          (widget.groupId?.isEmpty ?? true)) {
        throw Exception('Debes proporcionar un groupId o un idChat');
      }

      final filePath = selectedFile!.path!;
      final originalName = selectedFile!.name;
      final extension = path.extension(filePath).toLowerCase();
      final type = _getFileType(
          extension); // Función que detecta el tipo automáticamente

      // Subir archivo
      final file = await http.MultipartFile.fromPath(
        'filePath',
        filePath,
        filename: originalName,
      );

      // Crear registro con TODOS los datos necesarios
      final response = await pb.collection(widget.collectionId).create(
        body: {
          'user': widget.user, // Verifica que widget.user no sea vacío
          'user1': widget.user1, // Verifica que widget.user1 no sea vacío
          'user2': widget.user2, // Verifica que widget.user2 no sea vacío
          'idChat': widget.idChat, // Puede ser nulo
          'grupoId': widget.groupId, // Puede ser nulo
          'grupoName': widget.groupName,
          'fechaMensaje': widget.fechaMensaje.isEmpty
              ? DateTime.now().toString()
              : widget.fechaMensaje,
          'originalName': originalName,
          'fileType': type,
        },
        files: [file],
      );

      // Procesar respuesta
      final fileUrl = response.data['filePath'] as String;
      final pbFileName = fileUrl.split('/').last;

      // Devolver datos completos
      widget.enviarFile?.call(
        true,
        response.data['id'],
        originalName,
        pbFileName,
        type, // Tipo devuelto en el callback
      );
      setState(() {
        status = "✅ Archivo subido: ${selectedFile!.name}";
        uploadSuccess = true; // Marcar como exitoso
      });
    } catch (e) {
      setState(() {
        status = "❌ Error: ${e.toString()}";
      });
      widget.enviarFile?.call(false, "", "", "", null);
    } finally {
      setState(() => isLoading = false);
    }
  }

// Función que detecta el tipo según extensión
  String _getFileType(String extension) {
    const imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
    const videoExtensions = ['.mp4', '.mov', '.avi', '.mkv'];
    const audioExtensions = ['.mp3', '.wav', '.ogg'];
    const docExtensions = ['.pdf', '.doc', '.docx', '.xls', '.txt'];

    if (imageExtensions.contains(extension)) return 'imagen';
    if (videoExtensions.contains(extension)) return 'video';
    if (audioExtensions.contains(extension)) return 'audio';
    if (docExtensions.contains(extension)) return 'documento';
    return 'other';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: pickFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonColor,
              foregroundColor: widget.buttonTextColor,
            ),
            child: Text("Seleccionar archivo"),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: uploadFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonColor,
              foregroundColor: widget.buttonTextColor,
            ),
            child: Text("Subir archivo"),
          ),
          SizedBox(height: 16),
          Text(
            status,
            style: TextStyle(color: widget.textColor),
          ),
          if (isLoading) CircularProgressIndicator(),
        ],
      ),
    );
  }
}

//
