import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier{

  bool _playing = false;
  AnimationController _controller;

  AnimationController get controller => this._controller;
  bool get playing => this._playing;

  set controller(AnimationController controller) {
    this._controller = controller;
  }


  set playing(bool playing) {
    this._playing = playing;
  }

}
