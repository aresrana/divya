import 'package:divya/services/song_provider.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../services/audio_player_service.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongProvider>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration:  BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(12)),
          border:Border.all(
              color:Colors.white,
              width:3
          ),
          boxShadow:  [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4.0,4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-5.0,-5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0

            )

          ]

      ),

      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.black,
                ),
                onPressed: () async {
                  provider.playPrevSong();
                  AudioPlayeService.instance.playSong(provider.playingSong!);
                  provider.setPlayingState(false);
                },
              )),
          Container(
              padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                icon: Icon(
                  provider.isPlaying ? Icons.play_arrow_rounded : Icons.pause,
                  color: Colors.black,
                ),
                onPressed: () async {
                  if (AudioPlayeService.instance.isPlaying) {
                    await AudioPlayeService.instance.pause();
                  } else {
                    AudioPlayeService.instance.resume();
                  }
                  provider
                      .setPlayingState(AudioPlayeService.instance.isPlaying);
                },
              )),
          Container(
              padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.black,
                ),
                onPressed: () {
                  provider.playNextSong();
                  AudioPlayeService.instance.playSong(provider.playingSong!);
                  provider.setPlayingState(false);
                },
              )),
          const SizedBox(width: 10),
          Expanded(
            child:GestureDetector(
            child: Marquee(
              textDirection: TextDirection.ltr,
              velocity: 30,
              blankSpace: 90,
              text: provider.playingSong?.title ?? 'N/A',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
              onTap: (){ },
            )
          )
        ],
      ),
    );
  }
}
