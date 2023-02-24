import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this._value);
  final int _value;

  String get title => 'you clicked $_value times';
}

class ProxyProvUpdate extends StatefulWidget {
  const ProxyProvUpdate({super.key});

  @override
  State<ProxyProvUpdate> createState() => _ProxyProvUpdateState();
}

class _ProxyProvUpdateState extends State<ProxyProvUpdate> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  /*proxyProvider가 update되는 시점
  * 의존하는 provider가 update 될때,
  * widget rebuild 될때
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('proxyProvider update'),
        ),
        body: Center(
            child: ProxyProvider0<Translations>(
          update: (context, translations) => Translations(counter),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              SizedBox(height: 20),
              IncreaseButton(increment: increment),
            ],
          ),
        )));
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${Provider.of<Translations>(context).title}',
      style: TextStyle(fontSize: 28),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;
  const IncreaseButton({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: increment, child: Text('increase'));
  }
}
