import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class BgColorState extends Equatable {
  final Color color;
  BgColorState({
    required this.color,
  });

  @override
  List<Object> get props => [color];

  @override
  String toString() => 'BgColorState(color: $color)';

  BgColorState copyWith({
    Color? color,
  }) {
    return BgColorState(
      color: color ?? this.color,
    );
  }
}

class BgColor extends StateNotifier<BgColorState> {
  BgColor() : super(BgColorState(color: Colors.blue));

  void changeColor() {
    /*  stateNotifier에서는 state에 대한 선언 없이 super call parameter로 정의되는 값을 state로 쓸수 있다. 
    state변경후 notifyListener를 호출하지 않아도 된다.
    */
    if (state.color == Colors.blue) {
      state = state.copyWith(color: Colors.black);
    } else if (state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    } else if (state.color == Colors.red) {
      state = state.copyWith(color: Colors.blue);
    }
  }
}
