// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

class UniversalViewer extends StatefulWidget {
  const UniversalViewer({
    super.key,
    this.width,
    this.height,
    required this.urlAudio,
    required this.urlVideo,
    required this.urlImagen,
  });

  final double? width;
  final double? height;
  final String urlAudio;
  final String urlVideo;
  final String urlImagen;

  @override
  State<UniversalViewer> createState() => _UniversalViewerState();
}

class _UniversalViewerState extends State<UniversalViewer> {
  VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    if (_isVideo(widget.urlVideo)) {
      _videoController = VideoPlayerController.network(widget.urlVideo)
        ..initialize().then((_) {
          setState(() {});
        });
    } else if (_isAudio(widget.urlAudio)) {
      _audioPlayer = AudioPlayer();
      await _audioPlayer!.setSourceUrl(widget.urlAudio);
    }
  }

  bool _isImage(String url) {
    return url.isNotEmpty &&
        (url.endsWith('.jpg') ||
            url.endsWith('.jpeg') ||
            url.endsWith('.png') ||
            url.endsWith('.gif') ||
            url.endsWith('.webp'));
  }

  bool _isVideo(String url) {
    return url.isNotEmpty &&
        (url.endsWith('.mp4') ||
            url.endsWith('.mov') ||
            url.endsWith('.avi') ||
            url.endsWith('.mpeg') ||
            url.endsWith('.webm'));
  }

  bool _isAudio(String url) {
    return url.isNotEmpty &&
        (url.endsWith('.mp3') ||
            url.endsWith('.wav') ||
            url.endsWith('.aac') ||
            url.endsWith('.midi') ||
            url.endsWith('.amr'));
  }

  @override
  Widget build(BuildContext context) {
    if (_isImage(widget.urlImagen)) {
      return Image.network(
        widget.urlImagen,
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
      );
    } else if (_isVideo(widget.urlVideo) && _videoController != null) {
      return _videoController!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            )
          : const Center(child: CircularProgressIndicator());
    } else if (_isAudio(widget.urlAudio) && _audioPlayer != null) {
      return ElevatedButton(
        onPressed: () => _audioPlayer!.play(UrlSource(widget.urlAudio)),
        child: const Text("Reproducir Audio"),
      );
    } else {
      return const Center(child: Text("Formato no soportado"));
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _audioPlayer?.dispose();
    super.dispose();
  }
}
