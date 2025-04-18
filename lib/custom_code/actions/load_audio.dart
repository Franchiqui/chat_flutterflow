// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

Future<void> loadAudio(String url, bool shouldPlay) async {
  final player = AudioPlayer();
  try {
    await player.setUrl(url);
    print("Audio cargado: $url");

    if (shouldPlay) {
      await player.play();
      print("Reproduciendo audio...");
    } else {
      print("Audio cargado pero no reproducido.");
    }
  } catch (e) {
    print("Error al cargar audio: $e");
  }
}

class AudioPlayerHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();
}
