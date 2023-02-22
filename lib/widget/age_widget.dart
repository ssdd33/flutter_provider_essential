import 'package:flutter/material.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:provider/provider.dart';

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('age:${Provider.of<Dog>(context).age}'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Provider.of<Dog>(context, listen: false).grow();
          },
          child: Text('grow'),
        ),
      ],
    );
  }
}
