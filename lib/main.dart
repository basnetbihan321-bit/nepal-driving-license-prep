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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const VehicleSelectScreen(),
    );
  }
}

class VehicleSelectScreen extends StatelessWidget {
  const VehicleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('सवारी छनोट गर्नुहोस्'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
              VehicleCard(
  title: 'Bike License',
  subtitle: 'Motorcycle Category',
  icon: Icons.two_wheeler,
  color: Colors.orange,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BikeScreen(),
      ),
    );
  },
),

},
           const SizedBox(height: 20),

VehicleCard(
  title: 'Car License',
  subtitle: 'Light Vehicle Category',
  icon: Icons.directions_car,
  color: Colors.blue,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CarScreen(),
      ),
    );
  },
 ),

class VehicleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const VehicleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:
