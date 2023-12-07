//Dava Nabila Muzaky 1462100153

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Apps',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
      },
    );
  }
}

