import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ampliffy_ctv_method_channel.dart';

abstract class AmpliffyCtvPlatform extends PlatformInterface {
  /// Constructs a AmpliffyCtvPlatform.
  AmpliffyCtvPlatform() : super(token: _token);

  static final Object _token = Object();

  static AmpliffyCtvPlatform _instance = MethodChannelAmpliffyCtv();

  /// The default instance of [AmpliffyCtvPlatform] to use.
  ///
  /// Defaults to [MethodChannelAmpliffyCtv].
  static AmpliffyCtvPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AmpliffyCtvPlatform] when
  /// they register themselves.
  static set instance(AmpliffyCtvPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<num?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}
