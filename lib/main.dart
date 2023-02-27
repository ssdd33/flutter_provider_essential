import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodosPage(),
    );
  }
}
