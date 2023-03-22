import 'package:flutter/material.dart';

class PetOverviewScreen extends StatefulWidget {
  const PetOverviewScreen({super.key});

  @override
  State<PetOverviewScreen> createState() => _PetOverviewScreen();
}

class _PetOverviewScreen extends State<PetOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
