import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ampliffy_ctv/ampliffy_ctv_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAmpliffyCtv platform = MethodChannelAmpliffyCtv();
  const MethodChannel channel = MethodChannel('ampliffy_ctv');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getPlatformVersion') {
          return '0.0.0';
        }
      },
    );
  });

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getBatteryLevel') {
          return 21;
        }
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '0.0.0');
  });

  test('getBatteryLevel', () async {
    expect(await platform.getBatteryLevel(), 21);
  });
}
