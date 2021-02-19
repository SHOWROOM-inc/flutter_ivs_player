import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class IvsPlayer {
  static const MethodChannel _channel = const MethodChannel('ivs_player');

/*  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }*/

  static UiKitView player({String url, bool isHidden = false}) {
    UiKitView res;
    try {
      res = UiKitView(
          viewType: 'ivs_player/player_View',
          creationParams: <String, dynamic>{
            'url': url,
            'isHidden': isHidden,
          },
          creationParamsCodec: StandardMessageCodec(),
          onPlatformViewCreated: (id) {
            print('UiKitView created: id = $id');
          });
    } catch (e) {
      print(e);
    }
    return res;
  }
}
