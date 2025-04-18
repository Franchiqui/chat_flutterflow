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

Future<String?> getAudioUrl(String id) async {
  final String baseUrl = "https://pocketbase-chat.fly.dev";
  final String collection = "mensajes";

  try {
    // Obtener el mensaje por ID
    final response = await http.get(
      Uri.parse("$baseUrl/api/collections/$collection/records/$id"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String audioFile = data['audio']; // Nombre del archivo

      if (audioFile.isNotEmpty) {
        // Construir la URL del archivo de audio
        final String audioUrl = "$baseUrl/api/files/$collection/$id/$audioFile";
        return audioUrl; // Retorna la URL del audio
      }
    } else {
      print("Error al obtener el mensaje: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }

  return null; // Retorna null si no encuentra nada
}
