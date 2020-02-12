import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MP3Player {
  AudioPlayer audioPlayers;
  bool playing = false;
  String audioFile;

  MP3Player();

  Future<void> initializeMP3(String audioFile) async {
//    audioPlayers = await AudioCache().loop(audioFile);
    audioPlayers = await AudioCache().play(audioFile);
    this.audioFile = audioFile;
  }

  Future<void> playPause() async {
    if (audioPlayers == null) {
      await initializeMP3(audioFile);
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
