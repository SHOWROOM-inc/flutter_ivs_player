import Flutter
import UIKit
import AmazonIVSPlayer

public class SwiftIvsPlayerPlugin: NSObject, FlutterPlugin {

  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ivs_player", binaryMessenger: registrar.messenger())
    let instance = SwiftIvsPlayerPlugin()  
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    result("iOS " + UIDevice.current.systemVersion)
  }
}
