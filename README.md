# ivs_player

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to Use

```
var ivsPlayer = new IvsPlayer();
ivsPlayer.init();

// child: ivsPlayer.playerにUiKitViewが格納されてるので下記のように利用
// TODO:これのインターフェイスは変更するかも(Containerでラッピングするかも
Container(
	child:child: ivsPlayer.player,
    width: 640,
    height: 360,
)

// isHiddenをtrueにするとビデオ表示せず音声飲のみ(ラジオ配信などで利用
ivsPlayer.play({url:"hlsのurl", isHidden:true;))

// 停止
ivsPlayer.stop();

// 設定したurl含めすべてクリア disposeのタイミングでかならず呼ぶ。
ivsPlayer.clear();

```