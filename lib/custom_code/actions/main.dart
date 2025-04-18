// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../main.dart';
import 'package:audio_service/audio_service.dart';
import 'load_audio.dart'; // Archivo donde está la clase AudioPlayerHandler

bool shouldPlay = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(
        idChat: "chat123",
        username: "user",
        password: "pass",
        text: "Hola",
        listaMensajes: (mensajes) async {},
        tono: "assets/sound.mp3",
        contenedorColor1: Colors.blue,
        contenedorColor2: Colors.grey,
        mensajeColor: Colors.white,
        textFielColor: Colors.black,
        textFielContainerColor: Colors.white,
        user1: "User1",
        user2: "User2",
        enviar: false,
        onNewMessageReceived: (bool play) async {
          // 👈 Callback asíncrono
          shouldPlay = play;
          if (shouldPlay) {
            await loadAudio(
                "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-4pf22a/assets/teose6j2jlz6/notification.mp3",
                shouldPlay);
          }
        },
      ),
    );
  }

  ChatScreen(
      {required String idChat,
      required String username,
      required String password,
      required String text,
      required Future<Null> Function(dynamic mensajes) listaMensajes,
      required String tono,
      required contenedorColor1,
      required contenedorColor2,
      required mensajeColor,
      required textFielColor,
      required textFielContainerColor,
      required String user1,
      required String user2,
      required bool enviar,
      required Future<Null> Function(bool play) onNewMessageReceived}) {}
}
