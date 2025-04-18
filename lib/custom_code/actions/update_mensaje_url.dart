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

Future updateMensajeUrl(
  String idChat,
  String user,
  String user2,
  String fechaMensaje,
) async {
  final String baseUrl = "https://pocketbase-chat.fly.dev";
  final String collection = "mensajes";

  try {
    // Buscar el mensaje que coincida con los parámetros
    final response = await http.get(
      Uri.parse("$baseUrl/api/collections/$collection/records?filter="
          "idChat='$idChat'&&user='$user'&&user2='$user2'&&fechaMensaje='$fechaMensaje'"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['items'].isNotEmpty) {
        final mensaje = data['items'][0]; // Tomamos el primer resultado
        final String recordId = mensaje['id'];
        final String audioFile = mensaje['audio']; // Nombre del archivo

        if (audioFile.isNotEmpty) {
          // Construir la URL del archivo de audio
          final String audioUrl =
              "$baseUrl/api/files/$collection/$recordId/$audioFile";

          // Actualizar el mismo registro con el nuevo campo mensajeUrl y los parámetros adicionales
          final updateResponse = await http.patch(
            Uri.parse("$baseUrl/api/collections/$collection/records/$recordId"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "mensajeUrl": audioUrl,
              "idChat": idChat,
              "user": user,
              "user2": user2,
              "fechaMensaje": fechaMensaje,
            }),
          );

          if (updateResponse.statusCode == 200) {
            print("Mensaje actualizado con éxito: $audioUrl");
          } else {
            print("Error al actualizar mensaje: ${updateResponse.body}");
          }
        }
      } else {
        print("No se encontró un mensaje con esos parámetros.");
      }
    } else {
      print("Error al obtener mensajes: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
