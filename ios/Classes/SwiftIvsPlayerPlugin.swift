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


  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

}


extension SwiftIvsPlayerPlugin: FlutterPlatformViewFactory {
  public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {

     let player = IVSPlayer()
     playerView.player = player
    if let args = args as? [String:Any?] {
        let urlString = args["url"] as? String ?? "no url"
        let url = URL(string: urlString)!;
        player.load(url)
        player.play()
        
        let isHidden = args["isHidden"] as? Bool ?? false;
        if (isHidden) {
            playerView.isHidden = true;
        }
        
     }
     
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
