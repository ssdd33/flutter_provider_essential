import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this._value);
  final int _value;

  String get title => 'you clicked $_value times';
}

class WhyProxyProv extends StatefulWidget {
  const WhyProxyProv({super.key});

  @override
  State<WhyProxyProv> createState() => _WhyProxyProvState();
}

class _WhyProxyProvState extends State<WhyProxyProv> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

/*setState 함수로 counter 값이 증가할때마다 widget이 rebuild되지만 
provider create는 1번만 실행되기때문에 변화한 counter값에 대해 알지 못한다.  
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Why proxyProvider'),
        ),
        body: Center(
            child: Provider<Translations>(
          create: (context) => Translations(counter),
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
