import 'package:flutter/material.dart';
import 'package:flutter_provider/utils/debounce.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider/models/todo_model.dart';
import 'package:flutter_provider/providers/providers.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              TodoHeader(),
              CreateTodo(),
              SizedBox(height: 10),
              SearchAndFilterTodo(),
              SizedBox(height: 10),
              ShowTodos()
            ],
          ),
        ),
      )),
    );
  }
}

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        Text(
          '${context.watch<ActiveTodoCount>().state.activeTodoCount} items left',
          style: TextStyle(
            fontSize: 20,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? desc) {
        if (desc != null && desc.trim().isNotEmpty) {
          context.read<TodoList>().addTodo(desc);
          newTodoController.clear();
        }
      },
    );
  }
}

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});
  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: 'search todo',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              debounce.run(() {
                context.read<TodoSearch>().setSearchTerm(newSearchTerm);
              });
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    final Filter currentFilter = context.watch<TodoFilter>().state.filter;
    return TextButton(
      child: Text(
        '${filter == Filter.all ? 'All' : filter == Filter.active ? 'active' : 'completed'}',
        style: TextStyle(
          color: currentFilter == filter ? Colors.blue : Colors.grey,
        ),
      ),
      onPressed: () {
        context.read<TodoFilter>().changeFilter(filter);
      },
    );
  }
}

class ShowTodos extends StatelessWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodos>().state.filteredTodos;

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(todos[index].id),
        background: showBackground(0),
        secondaryBackground: showBackground(1),
        onDismissed: (_) {
          context.read<TodoList>().removeTodo(todos[index]);
        },
        confirmDismiss: (_) {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('are u sure?'),
                content: Text('r u really want to delete?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('No'),
                  ),
                ],
              );
            },
          );
        },
        child: TodoItem(todo: todos[index]),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.grey),
      itemCount: todos.length,
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
      color: Colors.red,
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool _error = false;
              textEditingController.text = widget.todo.desc;

              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: Text('Edit todo'),
                  content: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? 'value cannot be empty' : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _error =
                              textEditingController.text.isEmpty ? true : false;

                          if (!_error) {
                            context.read<TodoList>().EditTodo(
                                widget.todo.id, textEditingController.text);
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Text('EDIT'),
                    ),
                  ],
                );
              });
            });
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoList>().togleTodo(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
