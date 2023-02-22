import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/breedAndAge_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: 'dog03', breed: 'breed03');

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('provider03')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('name: ${dog.name}'),
          BreedAndAge(dog: dog),
        ],
      ),
    );
  }
}
