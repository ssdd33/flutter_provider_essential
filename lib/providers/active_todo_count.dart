import 'package:equatable/equatable.dart';

class ActiveTodoCountState extends Equatable {
  final int count;
  ActiveTodoCountState({
    required this.count,
  });

  @override
  List<Object> get props => [count];

  @override
  String toString() => 'ActiveTodoCountState(count: $count)';

  ActiveTodoCountState copyWith({
    int? count,
  }) {
    return ActiveTodoCountState(
      count: count ?? this.count,
    );
  }
}
