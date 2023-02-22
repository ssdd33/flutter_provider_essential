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
      appBar: AppBar(title: Text('provider08')),
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child!,
              SizedBox(height: 10),
              Text('name: ${dog.name}'),
              BreedAndAge(),
            ],
          );
        },
        child: Text('i love dog'),
      ),
    );
  }
}
