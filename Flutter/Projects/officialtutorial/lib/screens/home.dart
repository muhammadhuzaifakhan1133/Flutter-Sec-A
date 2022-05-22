import 'package:flutter/material.dart';
import 'package:officialtutorial/components/random_words.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
      ),
      body: const Center(
        child: RandomWords(),
      ),
    );
  }
}
