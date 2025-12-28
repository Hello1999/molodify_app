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
}
