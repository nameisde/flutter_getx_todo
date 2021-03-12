import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/models/todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
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
                    hintText: 'What do you want to accomplish ?',
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
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      todoController.todos.add(
                        Todo(
                          title: textEditingController.text,
                        ),
                      );
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
