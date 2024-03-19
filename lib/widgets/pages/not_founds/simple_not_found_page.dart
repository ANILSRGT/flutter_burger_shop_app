import 'package:flutter/material.dart';

class SimpleNotFoundPage extends StatelessWidget {
  const SimpleNotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}
