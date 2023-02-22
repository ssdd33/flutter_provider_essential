import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:provider/provider.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(builder: (_, dog, __) {
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
    });
  }
}
