import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/todos_page.dart';
import 'package:flutter_provider/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(create: (context) => TodoFilter()),
        ChangeNotifierProvider<TodoSearch>(create: (context) => TodoSearch()),
        ChangeNotifierProvider<TodoList>(create: (context) => TodoList()),
        ProxyProvider<TodoList, ActiveTodoCount>(
          update:
              (BuildContext context, TodoList todoList, ActiveTodoCount? _) =>
                  ActiveTodoCount(todoList: todoList),
        ),
        ProxyProvider3<TodoList, TodoFilter, TodoSearch, FilteredTodos>(
          update: (BuildContext context,
                  TodoList todoList,
                  TodoFilter todoFilter,
                  TodoSearch todoSearch,
                  FilteredTodos? _) =>
              FilteredTodos(
                  todoList: todoList,
                  todoFilter: todoFilter,
                  todoSearch: todoSearch),
        ),
      ],
      child: MaterialApp(
        title: 'TODOS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}
