import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier{

  bool _playing = false;
  AnimationController _controller;
  Duration _songDuration = new Duration( milliseconds: 0 );
  Duration _current = new Duration( milliseconds: 0 );

  String get songTotalDuration => this.pintDuration(this._songDuration);
  String get songCurrentTime => this.pintDuration(this._current);
  double get porcentaje => (this._songDuration.inSeconds > 0) ? this._current.inSeconds / this._songDuration.inSeconds
                                                              : 0;

  AnimationController get controller => this._controller;
  bool get playing => this._playing;
  Duration get current => this._current;
  Duration get songDuration => this._songDuration;

  set controller(AnimationController controller) {
    this._controller = controller;
  }

  set playing(bool playing) {
    this._playing = playing;
    notifyListeners();
  }

  set current(Duration current) {
    this._current = current;
    notifyListeners();
  }

  set songDuration(Duration songDuration) {
    this._songDuration = songDuration;
  }

  String pintDuration( Duration duration ){
    String twoDigits( int n ){
      if ( n >= 10 ) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits( duration.inMinutes.remainder(60) );
    String twoDigitSeconds = twoDigits( duration.inSeconds.remainder(60) );

    return '$twoDigitMinutes:$twoDigitSeconds';
  }

}
