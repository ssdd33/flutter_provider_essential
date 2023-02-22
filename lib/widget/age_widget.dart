import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:provider/provider.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('age:${context.select<Dog, int>((Dog dog) => dog.age)}'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<Dog>().grow();
          },
          child: Text('grow'),
        ),
      ],
    );
  }
}
