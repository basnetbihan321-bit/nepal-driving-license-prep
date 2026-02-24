import 'package:flutter/material.dart';

void main() {
  runApp(const LicensePrepApp());
}

class LicensePrepApp extends StatelessWidget {
  const LicensePrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal License Prep',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('नेपाल लाइसेन्स तयारी'),
      ),
      body: const Center(
        child: Text(
          'Welcome 🚗🏍️',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
