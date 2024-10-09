import 'package:flutter/material.dart';
import 'package:localstorage/controller/home_screen_controller.dart';
import 'package:localstorage/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HomeScreenController.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
