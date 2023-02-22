import 'package:flutter/material.dart';

import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/widget/age_widget.dart';
import 'package:provider/provider.dart';

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(builder: (_, Dog dog, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('breed:${dog.breed}'),
          Age(),
        ],
      );
    });
  }
}
