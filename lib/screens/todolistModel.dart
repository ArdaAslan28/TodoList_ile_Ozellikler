import 'package:flutter/material.dart';
import 'package:project/models/todo.dart';


class TodoListModel extends StatefulWidget {
  const TodoListModel({super.key});

  @override
  State<TodoListModel> createState() => _TodoListModelState();
}

class _TodoListModelState extends State<TodoListModel> {
  List<Todo> TodoListModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoListModel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        TodoListModel.clear();
                        setState(() {
                          for (var i = 0; i < 1000000; i++) {
                            Todo todo = Todo(id: i + 1, title: "Başlık ${i + 1}", isComplated: i % 2 == 0 ? true : false);
                            TodoListModel.add(todo);
                          }
                        });
                      },
                      child: const Text("TodoListModel Üret")),
                )),
            Expanded(
              flex: 3,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                itemCount: TodoListModel.length,
                itemBuilder: (context, index) {
                  var element = TodoListModel[index];
                  return ListTile(
                    tileColor: element.isComplated
                        ? Colors.red[100]
                        : Colors.green[100],
                    leading: Checkbox(
                        onChanged: (newValue) {
                          setState(() {
                            element.isComplated = newValue!;
                          });
                        },
                        value: element.isComplated),
                    title: Text(
                      element.title,
                      style: TextStyle(
                          decoration: element.isComplated
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    subtitle: const Text("Görevi tamamlandıysa işaretle..."),
                    trailing: InkWell(
                        onTap: () {
                          setState(() {
                            TodoListModel.remove(element);
                          });
                        },
                        child: const Icon(Icons.delete)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
