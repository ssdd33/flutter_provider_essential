import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCounter = 0;

  @override
  void initState() {
    super.initState();
/*

render cycle 
 - create element ( buildContext )
 - initState ( 현재 로직이 실행되는 단계 )
 - didWidgetChanged
 - build
* setState() or MarkNeedsbuild() error  : build가 완료되지 않은 상태에서 새로운 build를 요청했을때 발생
 -> addPostFrameCallback , future 메소드를 사용하여 build가 완료된 이후로 로직 실행 시점을 미룬다. 
*/

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Counter>().increment();
      myCounter = context.watch<Counter>().counter + 10;
    });

    // Future.delayed(Duration(seconds: 0), () {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });

    // Future.microtask(() {
    //   context.read<Counter>().increment();
    //   myCounter = context.read<Counter>().counter + 10;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Text(
            'counter :${context.watch<Counter>().counter} \nmyCounter : $myCounter'),
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
