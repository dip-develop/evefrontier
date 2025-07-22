import 'package:evefrontier_tools/src/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVE Frontier Tools',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),

      home: const MapScrean(),
    );
  }
}
