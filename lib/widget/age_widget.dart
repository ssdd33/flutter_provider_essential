import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:provider/provider.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
        selector: (BuildContext context, Dog dog) => dog.age,
        builder: (_, int age, __) {
          return Column(
            children: [
              Text('age:$age'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<Dog>().grow();
                },
                child: Text('grow'),
              ),
            ],
          );
        });
  }
}
