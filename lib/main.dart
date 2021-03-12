import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/screens/home_screen.dart';
import 'package:flutter_getx_todo/screens/todo_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}