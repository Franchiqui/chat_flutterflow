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

Future<String> getDeepSeekResponse(
  String userRole,
  String userContent,
) async {
  const apiKey = "sk-b66f2903508e4a4c91cbd8c60d130fb8";
  final url = Uri.parse("https://api.deepseek.com/beta/chat/completions");

  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // Lista de mensajes con parámetros dinámicos
  final messages = [
    {'role': userRole, 'content': userContent},
    {'role': 'assistant', 'content': '```python\n', 'prefix': true},
  ];

  final body = jsonEncode({
    'model': 'deepseek-chat',
    'messages': messages,
    'stop': ['```']
  });

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['choices'][0]['message']['content'];
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    throw Exception('Error en la solicitud: $e');
  }
}
