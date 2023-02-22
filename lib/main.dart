import 'package:flutter/material.dart';
import 'package:flutter_provider/models/babies.dart';
import 'package:flutter_provider/models/dog.dart';
import 'package:flutter_provider/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('myapp build');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog07', breed: 'breed07', age: 3),
        ),
        FutureProvider<int>(
            initialData: 0,
            create: (context) {
              final dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge);
              return babies.getBabies();
            }),
        StreamProvider<String>(
            create: (context) {
              final int dogAge = context.read<Dog>().age;
              print('reCreate streamProvider, dogAge: ${dogAge}');
              final babies = Babies(age: dogAge * 2);
              return babies.bark();
            },
            initialData: 'inital value')
      ],
      child: MaterialApp(
        title: 'provider07',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
