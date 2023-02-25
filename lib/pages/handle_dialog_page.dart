import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/providers/counter.dart';

class HandelDialogPage extends StatefulWidget {
  const HandelDialogPage({super.key});

  @override
  State<HandelDialogPage> createState() => _HandelDialogPageState();
}

class _HandelDialogPageState extends State<HandelDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('handle dialog'),
      ),
      body: Center(
        child: Text('${context.watch<Counter>().counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}
