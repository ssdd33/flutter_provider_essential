import 'package:flutter/material.dart';

import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/age_widget.dart';

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('breed:${dog.breed}'),
        Age(dog: dog),
      ],
    );
  }
}
