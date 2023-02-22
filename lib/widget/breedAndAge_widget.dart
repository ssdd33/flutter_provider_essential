import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/age_widget.dart';
import 'package:provider/provider.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('breed:${Provider.of<Dog>(context).breed}'),
        Age(),
      ],
    );
  }
}
