import 'package:flutter_test/flutter_test.dart';
import 'package:ampliffy_ctv/ampliffy_ctv.dart';
import 'package:ampliffy_ctv/ampliffy_ctv_platform_interface.dart';
import 'package:ampliffy_ctv/ampliffy_ctv_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAmpliffyCtvPlatform
    with MockPlatformInterfaceMixin
    implements AmpliffyCtvPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('0.0.0');

  // Here, we're overriding the getBatteryLevel() method to return a fixed value of 21,
  // which will be tested in the following test.
  @override
  Future<num?> getBatteryLevel() => Future.value(21);
}

void main() {
  final AmpliffyCtvPlatform initialPlatform = AmpliffyCtvPlatform.instance;

  test('$MethodChannelAmpliffyCtv is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAmpliffyCtv>());
  });

  test('getPlatformVersion', () async {
    AmpliffyCtv ampliffyCtvPlugin = AmpliffyCtv();
    MockAmpliffyCtvPlatform fakePlatform = MockAmpliffyCtvPlatform();
    AmpliffyCtvPlatform.instance = fakePlatform;

    expect(await ampliffyCtvPlugin.getPlatformVersion(), '0.0.0');
  });

  // We're creating a new test to verify if the previously overridden value is returned correctly.
  test('getBatteryLevel', () async {
    AmpliffyCtv mybatterypluginPlugin = AmpliffyCtv();
    MockAmpliffyCtvPlatform fakePlatform = MockAmpliffyCtvPlatform();
    AmpliffyCtvPlatform.instance = fakePlatform;

    expect(await mybatterypluginPlugin.getBatteryLevel(), 21);
  });
}
