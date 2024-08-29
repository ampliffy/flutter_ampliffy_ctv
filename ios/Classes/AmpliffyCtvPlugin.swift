import Flutter
import UIKit

public class AmpliffyCtvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ampliffy_ctv", binaryMessenger: registrar.messenger())
    let instance = AmpliffyCtvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        
        case "getBatteryLevel":
        
            // It is necessary to enable battery tracking before
            UIDevice.current.isBatteryMonitoringEnabled = true
        
            // We return the battery level in percent
            result(UIDevice.current.batteryLevel * 100)
        
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        
        default:
            result(FlutterMethodNotImplemented)
        
    }
  }
}
