// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateText(String prompt) async {
  // Configuración de tu NAS
  const nasIp = '192.168.1.130'; // Reemplaza con la IP de tu NAS
  const port = '11434';

  final response = await http.post(
    Uri.parse('http://$nasIp:$port/api/generate'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'model': 'tinyllama', // Nombre del modelo en tu Ollama
      'prompt': "Usuario: $prompt\nAsistente:",
      'stream': false,
      'options': {
        'temperature': 0.7,
        'max_tokens': 500,
      }
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['response'];
  } else {
    throw Exception('Error: ${response.statusCode}');
  }
}

// Ejemplo de uso
void main() async {
  final respuesta = await generateText("Explica el algoritmo quicksort");
  print(respuesta);
}
