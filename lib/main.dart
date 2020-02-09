import 'package:flutter/material.dart';
import 'package:guitarsologenerator/utilities/GuitarSoloGenerator.dart';
import 'package:guitarsologenerator/utilities/MP3Player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MP3Player mp3player;
  GuitarSoloGenerator guitarSoloGenerator;

  @override
  void dispose() {
    stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                playAudio();
              },
            ),
            OutlineButton(
              onPressed: () {
                stopAudio();
              },
            )
          ],
        ),
      ),
    );
  }

  void playAudio() {
    guitarSoloGenerator = new GuitarSoloGenerator();
    guitarSoloGenerator.play();
  }

  void stopAudio() {
    guitarSoloGenerator.stop();
  }
}
