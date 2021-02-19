import Flutter
import UIKit
import AmazonIVSPlayer

public class SwiftIvsPlayerPlugin: NSObject, FlutterPlugin {

  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ivs_player", binaryMessenger: registrar.messenger())
    let instance = SwiftIvsPlayerPlugin()  
    registrar.register(instance, withId: "ivs_player/player_View")
    registrar.addMethodCallDelegate(instance, channel: channel)
     // 登録
  }


    private let playerView = IVSPlayerView()
    var player: IVSPlayer?


  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "stop" {
        player?.pause()
    }
    if call.method == "clear" {
        player?.pause()
        player = IVSPlayer()
    }
    if call.method == "play" {
        if let args =  call.arguments  as? [String:Any?] {
            if let existingPlayer = self.player {
                player = existingPlayer
            } else {
                player = IVSPlayer()
            }
            
            let urlString = args["url"] as? String ?? "no url"
            let url = URL(string: urlString)!;
            player?.load(url)
            player?.play()
            
            let isHidden = args["isHidden"] as? Bool ?? false;
            if (isHidden) {
                playerView.isHidden = true;
            }
         }
    }
  }

}


extension SwiftIvsPlayerPlugin: FlutterPlatformViewFactory {
  public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    
    if let existingPlayer = self.player {
        player = existingPlayer
    } else {
        player = IVSPlayer()
    }
    
     playerView.player = player
     return SwiftIvsyPlatformView(playerView)
  }
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
       return FlutterStandardMessageCodec.sharedInstance()
  }
}


class SwiftIvsyPlatformView: NSObject, FlutterPlatformView {
    let playerView: IVSPlayerView
    init(_ playerView: IVSPlayerView) {
        self.playerView = playerView
        super.init()
    }

    func view() -> UIView {
        return playerView
    }
}
