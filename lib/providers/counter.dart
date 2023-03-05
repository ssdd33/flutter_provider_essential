import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/bg_color.dart';
import 'package:state_notifier/state_notifier.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

class Counter extends StateNotifier<CounterState> with LocatorMixin {
  Counter() : super(CounterState(counter: 0));

  void increment() {
    print(read<BgColor>().state);

    Color currentColor = read<BgColor>().state.color;

    if (currentColor == Colors.black) {
      state = state.copyWith(counter: state.counter + 10);
    } else if (currentColor == Colors.red) {
      state = state.copyWith(counter: state.counter - 10);
    } else {
      state = state.copyWith(counter: state.counter + 1);
    }
  }

  @override
  void update(Locator watch) {
    // TODO: implement update
    print('${watch<BgColorState>().color}');
    print('${watch<BgColor>().state.color}');
    super.update(watch);
  }
}
