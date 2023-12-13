import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;

  const DetailScreen({super.key, required this.imagePath, required String Restaurant, required String HotelsScreen,  required String WorkSaceScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
