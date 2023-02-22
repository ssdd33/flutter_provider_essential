import 'package:flutter/material.dart';

import 'package:flutter_provider/models/dog.dart';

class Age extends StatelessWidget {
  final Dog dog;
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('age:${dog.age}'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            dog.grow();
          },
          child: Text('grow'),
        ),
      ],
    );
  }
}
