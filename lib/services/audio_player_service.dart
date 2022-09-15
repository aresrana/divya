import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:divya/model/song.dart';

class AudioPlayeService {
  final _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Function? onAudioComplet;
  AudioPlayeService._() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.PLAYING;
    });
    _audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
    });
    _audioPlayer.onAudioPositionChanged.listen((newPosition) {
      position = newPosition;
    });
    _audioPlayer.onPlayerCompletion.listen((event) {
      if (onAudioComplet != null) {
        onAudioComplet!();
      }
    });
  }
  static AudioPlayeService? _instance;
  static AudioPlayeService get instance {
    return _instance ??= AudioPlayeService._();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  void playSong(Song song) async {
    await _audioPlayer.pause();
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.play(song.music);
  }

  void dispose() {
    _audioPlayer.dispose();
    _instance = null;
  }

  void seekTo() {
    log('$duration');
    _audioPlayer.seek(const Duration(minutes: 5));
  }
}
