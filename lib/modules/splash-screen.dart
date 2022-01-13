import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_pp/layout/home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: const Image(image: AssetImage('images/todo.png')),
        logoSize: 100,
        showLoader: false,
        title: const Text(
          'ToDo App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        durationInSeconds: 2,
        navigator: HomeLayout(),
      ),
    );
  }
}
