import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/breedAndAge_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('provider06')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('name: ${context.watch<Dog>().name}'),
          BreedAndAge(),
        ],
      ),
    );
  }
}
