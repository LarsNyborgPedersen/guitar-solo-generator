import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MP3Player {
  String audioFile;
  AudioPlayer audioPlayers;
  bool playing = false;

  MP3Player({@required this.audioFile});

  Future<void> _initializeMP3() async {
    audioPlayers = await AudioCache().loop(audioFile);
  }

  Future<void> playPause() async {
    if (audioPlayers == null) {
      await _initializeMP3();
      playing = true;
      audioPlayers.setReleaseMode(ReleaseMode.RELEASE);
    } else if (playing == true) {
      await audioPlayers.pause();
      playing = false;
    } else {
      await audioPlayers.resume();
      playing = true;
    }
  }

  stop() {
    if (audioPlayers != null) {
      audioPlayers.stop();
    }
  }
}
