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
    return Selector<Dog, String>(
        selector: (BuildContext context, Dog dog) => dog.breed,
        builder: (_, String breed, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('breed:$breed'),
              Age(),
            ],
          );
        });
  }
}
