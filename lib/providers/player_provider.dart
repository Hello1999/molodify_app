import 'dart:async';

import 'package:flutter/material.dart';
import 'package:melodify_app/models/song.dart';

enum RepeatMode { off, all, one }

enum PlayerState { idle, playing, paused, loading }

class PlayerProvider extends ChangeNotifier {
  PlayerState _playerState = PlayerState.idle;
  Song? _currentSong;
  List<Song> _queue = [];
  int _currentIndex = -1;

  Duration _position = Duration.zero;
  Duration _bufferedPosition = Duration.zero;
  Timer? _positionTimer;

  bool _shuffle = false;
  RepeatMode _repeatMode = RepeatMode.off;

  double _volume = 1.0;

  PlayerState get playerState => _playerState;
  Song? get currentSong => _currentSong;
  List<Song> get queue => _queue;
  int get currentIndex => _currentIndex;
  Duration get position => _position;
  Duration get buffedPosition => _bufferedPosition;
  bool get shuffle => _shuffle;
  RepeatMode get repeatMode => _repeatMode;
  double get volume => _volume;
  bool get isPlaying => _playerState == PlayerState.playing;
  bool get hasNext =>
      _currentIndex < _queue.length - 1 || _repeatMode != RepeatMode.off;
  bool get hasPrevious => _currentIndex > 0 || _repeatMode != RepeatMode.off;

  double get progress {
    if (_currentSong == null) return 0;
    final total = _currentSong!.duration.inMilliseconds;
    if (total == 0) return 0;
    return _position.inMilliseconds / total;
  }

  Future<void> play(Song song, {List<Song>? playlist}) async {
    _playerState = PlayerState.loading;
    notifyListeners();

    if (playlist != null) {
      _queue = List.from(playlist);
      _currentIndex = _queue.indexWhere((s) => s.id == song.id);
      if (_currentIndex == -1) {
        _queue.insert(0, song);
        _currentIndex = 0;
      }
    } else if (_queue.isEmpty) {
      _queue = [song];
      _currentIndex = 0;
    } else {
      final existingIndex = _queue.indexWhere((s) => s.id == song.id);
      if (existingIndex != -1) {
        _currentIndex = existingIndex;
      } else {
        _queue.insert(_currentIndex + 1, song);
        _currentIndex++;
      }
    }

    _currentSong = song;
    _position = Duration.zero;

    await Future.delayed(Duration(milliseconds: 300));

    _playerState = PlayerState.playing;
    _startPositionTimer();
    notifyListeners();
  }

  void _startPositionTimer() {}
}
