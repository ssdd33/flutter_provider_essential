import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'anonymous Router',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
          builder: (BuildContext context, Widget? _) => MyHomePage(),
        ));
  }
}

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (CounterContext) => ChangeNotifierProvider.value(
                        value: context.read<Counter>(), child: ShowMeCounter()),
                  ),
                );
              },
              child: Text('show me counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: Text('increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${context.read<Counter>().count}'),
        ));
  }
}
