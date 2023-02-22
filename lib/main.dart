import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('provider11'),
        ),
        body: Center(
          child: ChangeNotifierProvider<Counter>(
            create: (context) => Counter(),
            child: ChildWidget(),
          ),
        ));
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${context.watch<Counter>().count}'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<Counter>().increment();
          },
          child: Text('increment'),
        ),
      ],
    );
  }
}
