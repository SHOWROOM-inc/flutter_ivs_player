import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class IvsPlayer {
  static const MethodChannel _channel = const MethodChannel('ivs_player');
  UiKitView player;

  Future<void> stop() async {
    await _channel.invokeMethod('stop');
  }

  Future<void> clear() async {
    await _channel.invokeMethod('clear');
  }

  Future<void> play({String url, bool isHidden = false}) async {
    final Map params = <String, dynamic>{
      'url': url,
      'isHidden': isHidden,
    };
    await _channel.invokeMethod('play', params);
  }

  init() {
    try {
      player = UiKitView(
          viewType: 'ivs_player/player_View',
          onPlatformViewCreated: (id) {
            print('UiKitView created: id = $id');
          });
    } catch (e) {
      print(e);
    }
    return player;
  }
}
