import 'ampliffy_ctv_platform_interface.dart';

class AmpliffyCtv {
  Future<String?> getPlatformVersion() {
    return AmpliffyCtvPlatform.instance.getPlatformVersion();
  }

  // Smartphone Battery Level read function
  Future<num?> getBatteryLevel() {
    return AmpliffyCtvPlatform.instance.getBatteryLevel();
  }
}
