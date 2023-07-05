import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/app/modules/home/view.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init(); 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'ToDo app using GetX',
      home: HomePage(),
    );
  }
}
