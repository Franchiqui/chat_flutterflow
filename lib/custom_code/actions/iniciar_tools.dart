// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:accessibility_tools/accessibility_tools.dart';

Future iniciarTools() async {
  // Add your function code here!
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get lightTheme => null;

  get darkTheme => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return AccessibilityTools(
          enableButtonsDrag: true,
          checkFontOverflows: true,
          checkImageLabels: true,
          checkTextContrast: true,
          checkTapTargets: true,
          contrastRatioThreshold: 4.5,
          buttonsAlignment: ButtonsAlignment.bottomRight,
          child: child!,
        );
      },
      home: const MyHomePage(),
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }

  AccessibilityTools(
      {required bool enableButtonsDrag,
      required bool checkFontOverflows,
      required bool checkImageLabels,
      required bool checkTextContrast,
      required bool checkTapTargets,
      required double contrastRatioThreshold,
      required buttonsAlignment,
      required child}) {}
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility Demo')),
      body: const Center(child: Text('Contenido de la app')),
    );
  }
}
