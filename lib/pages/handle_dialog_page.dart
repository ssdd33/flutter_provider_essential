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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('becareful!'),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text('${context.read<Counter>().counter}'),
          ),
        );
      });
    }

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
