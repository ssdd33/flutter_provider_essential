import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  void increment() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter'),
      ),
      body: Column(
        children: [
          const Text('MyHomePage'),
          CounterA(
            counter: counter,
            increment: increment,
          ),
          Middle(
            counter: counter,
          )
        ],
      ),
    );
  }
}

class CounterA extends StatefulWidget {
  final int counter;
  final dynamic increment;

  const CounterA({super.key, required this.counter, required this.increment});

  @override
  State<CounterA> createState() => _CounterAState();
}

class _CounterAState extends State<CounterA> {
  int ownCounter = 0;

  void ownIncrement() {
    setState(() {
      ownCounter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('counterA build');
    return Row(
      children: [
        Column(
          children: [
            Text('${widget.counter}'),
            ElevatedButton(
              onPressed: widget.increment,
              child: const Text('increment'),
            ),
          ],
        ),
        Column(
          children: [
            Text('$ownCounter'),
            ElevatedButton(
              onPressed: ownIncrement,
              child: const Text('ownIncrement'),
            ),
          ],
        ),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;
  const Middle({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    print('Middle build');
    return Row(
      children: [CounterB(counter: counter), const Text('sibling')],
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;
  const CounterB({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    print('counterB build');
    return Text('$counter');
  }
}
