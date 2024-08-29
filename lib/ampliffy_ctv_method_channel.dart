import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ampliffy_ctv_platform_interface.dart';

/// An implementation of [AmpliffyCtvPlatform] that uses method channels.
class MethodChannelAmpliffyCtv extends AmpliffyCtvPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ampliffy_ctv');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<num?> getBatteryLevel() {
    return methodChannel.invokeMethod<num?>('getBatteryLevel');
  }
}
