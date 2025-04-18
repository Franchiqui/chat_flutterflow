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

Future<String?> grtUrlVideo(
  String baseUrl,
  String collection,
  String field,
  String id,
) async {
  // Construct the API endpoint URL
  final String apiUrl = '$baseUrl/api/collections/$collection/records/$id';

  try {
    // Make a GET request to fetch the record
    final response = await http.get(Uri.parse(apiUrl));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> data = json.decode(response.body);

      // Check if the field exists in the response
      if (data.containsKey(field)) {
        // Return the URL of the file
        return data[field];
      } else {
        print('Field "$field" not found in the record.');
        return null;
      }
    } else {
      print('Failed to load record: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}
