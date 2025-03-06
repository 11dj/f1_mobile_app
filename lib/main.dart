import 'package:f1_mobile_app/views/views.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Telemetry Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MeetingsScreen(),
    );
  }
}
