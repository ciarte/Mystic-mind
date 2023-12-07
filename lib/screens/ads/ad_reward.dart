import 'package:flutter/material.dart';

class AdsRewardScreen extends StatelessWidget {
  const AdsRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Reward'),
      ),
      body: const Center(
        child: Text('Puntos actuales: '),
      ),
    );
  }
}
