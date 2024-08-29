import 'package:flutter/material.dart';

// Import Ampliffy CTV Plugin
import 'package:ampliffy_ctv/ampliffy_ctv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ampliffyCtvPlugin = AmpliffyCtv();

  // This is where we will store the battery level
  num? _batteryLevel;

  @override
  void initState() {
    super.initState();

    // Execute the method to retrieve the battery level
    _ampliffyCtvPlugin.getBatteryLevel().then((batteryLevel) {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // we display the battery level
          child: _batteryLevel != null
              ? Text('Battery Level: $_batteryLevel')
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
