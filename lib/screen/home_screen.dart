import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/breedAndAge_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dog')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('name: ${Provider.of<Dog>(context).name}'),
          BreedAndAge(),
        ],
      ),
    );
  }
}
