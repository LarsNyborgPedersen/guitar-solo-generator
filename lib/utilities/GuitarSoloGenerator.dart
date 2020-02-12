import 'dart:async';
import 'dart:math';

import 'package:guitarsologenerator/utilities/MP3Player.dart';

class GuitarSoloGenerator {
  MP3Player mp3playerSolo;
  MP3Player mp3playerBackingTrack;

  int oneBeatMicroSec = (60 / 110 * 1000000).toInt();
  bool shouldBePlaying = true;

//  play() async{
//    int playedThisManyTimes = 0;
//
//    initializeAudio();
//    await sleep(1);
//    mp3playerBackingTrack.playPause();
//    await sleep(4);
//    while (shouldBePlaying) {
//      mp3playerSolo.playPause();
//
//      print(playedThisManyTimes++);
//
//      await sleep(4);
//      chooseAndPlayRandomSoloClip();
//    }
//  }

  play2() async{
    int playedThisManyTimes = 0;
    DateTime now;

    initializeAudio();
    mp3playerBackingTrack.playPause();


//    Timer(Duration(microseconds: oneBeatMicroSec * 4), chooseAndPlayRandomSoloClip);
    now = DateTime.now();

    chooseAndPlayRandomSoloClip();
//    while (shouldBePlaying) {
//      int lenghtInMicroSec;
//
//      mp3playerSolo.audioPlayers.onDurationChanged.listen((Duration d) {
//        lenghtInMicroSec = d.inMicroseconds;
//      });
//
//      Timer(Duration(microseconds: 8000), chooseAndPlayRandomSoloClip);
//    }
  }

  stop() {
    mp3playerBackingTrack.stop();
    mp3playerBackingTrack.audioPlayers.release();
    mp3playerSolo.stop();
    mp3playerBackingTrack.audioPlayers.release();
  }

  initializeAudio() {
    String audioFile = "audio/backing-track/backing-track.mp3";
    mp3playerBackingTrack = new MP3Player();
    mp3playerBackingTrack.initializeMP3(audioFile);
  }

  void chooseAndPlayRandomSoloClip() async {
    Timer(Duration(seconds: 4), () {print("hey");});
    int randomNumber = Random().nextInt(7);
    String audioFile = "audio/guitar_solo_clips/" + (1 + randomNumber).toString() + ".mp3";
    mp3playerSolo = new MP3Player();
    mp3playerSolo.initializeMP3(audioFile);
    await mp3playerSolo.playPause();

    int lenghtInMicroSec;

    mp3playerSolo.audioPlayers.onDurationChanged.listen((Duration d) {
      lenghtInMicroSec = d.inMicroseconds;
    });

    Timer(Duration(seconds: 4), () {print("hey");});
  }

  Future sleep(double beatsToWait) async{
    int milliSecondsToWait = (beatsToWait * oneBeatMicroSec * 1000).toInt();
    return new Future.delayed(Duration(milliseconds: milliSecondsToWait));
  }
  Future sleep2(double beatsToWait, Function functionToCall) async{
    int milliSecondsToWait = (beatsToWait * oneBeatMicroSec * 1000).toInt();
    return new Future.delayed(Duration(milliseconds: milliSecondsToWait));
  }
}