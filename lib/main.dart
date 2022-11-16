import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx/homePage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(backgroundColor: Colors.indigo.shade100,
      primarySwatch: Colors.purple),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
