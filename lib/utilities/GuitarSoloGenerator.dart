import 'dart:math';

import 'package:guitarsologenerator/utilities/MP3Player.dart';

class GuitarSoloGenerator {
  MP3Player mp3playerSolo;
  MP3Player mp3playerBackingTrack;

  double oneBeatSec = 60/110;
  bool shouldBePlaying = true;

  play() async{
    int playedThisManyTimes = 0;

    initializeAudio();
    await sleep(1);
    mp3playerBackingTrack.playPause();
    await sleep(4);
    while (shouldBePlaying) {
      mp3playerSolo.playPause();

      print(playedThisManyTimes++);

      await sleep(4);
      chooseRandomSoloClip();
    }
  }

  stop() {
    mp3playerBackingTrack.stop();
    mp3playerBackingTrack.audioPlayers.release();
    mp3playerSolo.stop();
    mp3playerBackingTrack.audioPlayers.release();
  }

  initializeAudio() {
    String audioFile = "audio/backing-track/backing-track.mp3";
    mp3playerBackingTrack = new MP3Player(audioFile: audioFile);

    chooseRandomSoloClip();
  }

  void chooseRandomSoloClip() {
    int randomNumber = Random().nextInt(7);
    String audioFile = "audio/guitar_solo_clips/" + (1 + randomNumber).toString() + ".mp3";
    mp3playerSolo = new MP3Player(audioFile: audioFile);
  }

  Future sleep(double beatsToWait) async{
    int milliSecondsToWait = (beatsToWait * oneBeatSec * 1000).toInt();
    return new Future.delayed(Duration(milliseconds: milliSecondsToWait));
  }
}