import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('provider09'),
        ),
        body: ChangeNotifierProvider<Foo>(
          create: (context) => Foo(),
          child: Consumer<Foo>(
            builder: (
              BuildContext context,
              Foo foo,
              Widget? _,
            ) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${foo.value}'),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        foo.changeValue();
                      },
                      child: Text('change value'),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
