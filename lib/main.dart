import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/counter_page.dart';
import 'package:flutter_provider/pages/handle_dialog_page.dart';
import 'package:flutter_provider/pages/navigate_page.dart';
import 'package:flutter_provider/providers/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: MaterialApp(
        title: 'AddPostFrameCallback',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CounterPage(),
                          ));
                    },
                    child: Text('Counter Page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HandelDialogPage(),
                          ));
                    },
                    child: Text('Handle dialog Page')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NavigatePage(),
                          ));
                    },
                    child: Text('Navigate Page')),
              ],
            )),
      ),
    );
  }
}
