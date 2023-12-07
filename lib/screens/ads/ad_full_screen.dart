import 'package:flutter/material.dart';

class AdsFullScreen extends StatelessWidget {
  const AdsFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad full Screen'),
      ),
      body: const Center(
        child: Text('Ya puedes volver'),
      ),
    );
  }
}
