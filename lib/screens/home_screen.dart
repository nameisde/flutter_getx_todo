import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/screens/edit_todo_screen.dart';
import 'package:flutter_getx_todo/screens/todo_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController())!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(
          () {
            return ListView.separated(
              itemCount: todoController.todos.length,
              separatorBuilder: (context, pos) => Divider(),
              itemBuilder: (context, index) => Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                key: UniqueKey(),
                onDismissed: (_) {
                  todoController.todos.removeAt(index);
                  Get.snackbar(
                    'Removed',
                    'Task was successfully delete!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: ListTile(
                  title: Text(
                    todoController.todos[index].title!,
                    style: todoController.todos[index].done
                        ? TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Get.to(EditTodo(index: index));
                  },
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (newValue) {
                      var todo = todoController.todos[index];
                      todo.done = newValue!;
                      todoController.todos[index] = todo;
                    },
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
