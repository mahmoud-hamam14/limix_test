import 'package:flutter/material.dart';

class AvgTempView extends StatelessWidget {
  const AvgTempView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Average Temperature'),
      ),
      body: const Center(
        child: Text(
          'Average Temperature View',
          style: TextStyle(fontSize: 24),
        ),
      ),
      );
  }
}