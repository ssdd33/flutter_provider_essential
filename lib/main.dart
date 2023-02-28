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
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(
          create: (context) => ActiveTodoCount(),
          update: (BuildContext context, TodoList todoList,
                  ActiveTodoCount? activeTodoCount) =>
              activeTodoCount!..update(todoList),
        ),
        ChangeNotifierProxyProvider3<TodoList, TodoFilter, TodoSearch,
            FilteredTodos>(
          create: (context) => FilteredTodos(),
          update: (BuildContext context,
                  TodoList todoList,
                  TodoFilter todoFilter,
                  TodoSearch todoSearch,
                  FilteredTodos? filteredTodos) =>
              filteredTodos!..update(todoFilter, todoList, todoSearch),
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
