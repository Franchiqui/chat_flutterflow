// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> sendAudio(
  String id,
  String user,
  String user2,
  String idChat,
  String tipo,
  String fechaMensaje,
) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://graba-audio-pocketbase-copia.fly.dev/manage-audio'),
    );

    // Archivo de audio
    request.files.add(
      await http.MultipartFile.fromPath(
          'fileMp3', '/ruta/del/archivo/audio.mp3'),
    );

    // Parámetros adicionales
    request.fields.addAll({
      'id': '123',
      'user': 'usuario1',
      'user2': 'usuario2',
      'idChat': 'chat-abc',
      'fechaMensaje': '13:55',
      'tipo': 'audio'
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      // Convertir el Map a List<dynamic>
      final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      return [jsonResponse]; // Envolvemos el Map en una Lista
    } else {
      throw Exception(['Error', response.statusCode, responseBody]);
    }
  } catch (e) {
    throw Exception(['Exception', e.toString()]);
  }
}
