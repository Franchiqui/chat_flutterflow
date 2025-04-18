// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>?> uploadAudio(
  String urlBase,
  String coleccion,
  String campo,
  String fileMp3,
) async {
  try {
    // URL de la API
    final String apiUrl = "https://graba-audio-pocketbase.fly.dev/upload";

    // Convertir la ruta del archivo en un objeto File
    final File audioFile = File(fileMp3);

    // Verificar si el archivo existe
    if (!await audioFile.exists()) {
      print("Error: El archivo no existe en la ruta proporcionada.");
      return null;
    }

    // Leer el archivo en formato binario
    List<int> fileBytes = await audioFile.readAsBytes();

    // Crear el cuerpo de la solicitud
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.fields['urlBase'] = urlBase;
    request.fields['coleccion'] = coleccion;
    request.fields['campo'] = campo;
    request.files.add(
      http.MultipartFile.fromBytes(
        'fileMp3',
        fileBytes,
        filename:
            audioFile.path.split('/').last, // Extraer el nombre del archivo
      ),
    );

    // Enviar la solicitud
    var response = await request.send();

    // Manejar la respuesta
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);

      // Convertir el Map a un List<dynamic>
      List<dynamic> responseAsList = [
        jsonResponse['status'],
        jsonResponse['detail']
      ];

      // Imprimir los datos recibidos de la API
      print("Respuesta de la API: $responseAsList");

      // Devolver los datos como un List<dynamic>
      return responseAsList;
    } else {
      print("Error al subir el archivo: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
