import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:divya/screens/homePage.dart';

import 'package:divya/services/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../componet/mini_player.dart';

import '../screens/playlist.dart';
import '../screens/trial.dart';
import '../services/song_provider.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool isPlaying = false;
  int index = 0;
  final screens = [
    const MyHomePage(),
    const DashBoard(),
    const Playlist(),
    const DashBoard(),
  ];
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final provider = Provider.of<SongProvider>(context, listen: false);
    await provider.getSongsByCollection('Worship').then((value) {
      provider.setPlayingList(value);
    });
    AudioPlayeService.instance.onAudioComplet = () {
      provider.playNextSong();
      AudioPlayeService.instance.playSong(provider.playingSong!);
    };
  }

  @override
  void dispose() {
    AudioPlayeService.instance.dispose();
    super.dispose();
  }

  final items = const [
    Icon(Icons.home, size: 20),
     Icon(Icons.music_note, size: 20),
    Icon(Icons.add , size: 20),
    Icon(Icons.settings, size:20),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongProvider>(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (provider.playingSong != null) const MiniPlayer(),
            CurvedNavigationBar(
              items: items,
              index: index,
              height: 60,
              color: Colors.grey.shade200.withOpacity(0.9),
              backgroundColor: Colors.grey.shade300.withOpacity(0.1),
                buttonBackgroundColor: Colors.white,
              onTap: (index) => setState(() => this.index = index),
            ),
          ],
          // floatingActionButton: (widget.le!.isNotEmpty)? _playerControl(context):null,
        ),
      ),
    );
  }
}
