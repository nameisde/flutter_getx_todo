import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/models/todo.dart';
import 'package:get/get.dart';

class EditTodo extends StatelessWidget {
  final int index;

  EditTodo({required this.index});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController(
      text: todoController.todos[index].title,
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Update'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      var editing = todoController.todos[index];
                      editing.title = textEditingController.text;
                      todoController.todos[index] = editing;

                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
