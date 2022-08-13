import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:divya/screens/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../screens/trial.dart';

class PlayerPage extends StatefulWidget {
  late final String url;
  late final String music;
  late final String le;

  PlayerPage({

      required this.url,
     required this.music,
     required this.le,
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState(url, music, le);
}

class _PlayerPageState extends State<PlayerPage> {
  late final String url;
  late final String music;
  late final String le;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool _isLoading = false;
  _PlayerPageState(url, le, music);

  int index = 0;
  var screens = [];

   miniPlayer(le,url,music) {
   this.le =widget.le;
   this.url =widget.url;
   this.music =widget.music;
   setState(() {

   });
   if(widget.music.isEmpty) {
     return SizedBox();
   }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.indigo,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 6),
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 20,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  Expanded(
                      child: Marquee(
                    textDirection: TextDirection.ltr,
                    velocity: 30,
                    blankSpace: 90,
                    //pauseAfterRound: const Duration(seconds: 2),
                    text: widget.le,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ))
                ],
              ))
        ],
      ),
    );
  }



  @override
  void initState() {
    super.initState();
    screens = [    MyHomePage(miniPlayer),
      DashBoard(),
      MyHomePage(miniPlayer),
      MyHomePage(miniPlayer),
      MyHomePage(miniPlayer),
    ];

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    audioPlayer.setUrl(widget.music);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
    ];

    return SafeArea(
        top: false,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          extendBody: true,
          body: screens[index],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              miniPlayer(widget.le,widget.url,widget.music),
              Theme(
                data: Theme.of(context)
                    .copyWith(iconTheme: IconThemeData(color: Colors.white)),
                child: CurvedNavigationBar(
                  items: items,
                  index: index,
                  height: 55,
                  color: Colors.indigo,
                  backgroundColor: Colors.white,
                  buttonBackgroundColor: Colors.indigo,
                  onTap: (index) => setState(() => this.index = index),
                ),
              ),
            ],
            // floatingActionButton: (widget.le!.isNotEmpty)? _playerControl(context):null,
          ),
        ));
  }

  Widget _playerControl(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 6),
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 20,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
                padding: EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Expanded(
                        child: Marquee(
                      textDirection: TextDirection.ltr,
                      velocity: 30,
                      blankSpace: 90,
                      //pauseAfterRound: const Duration(seconds: 2),
                      text: widget.le,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ))
          ],
        ));
  }
}
