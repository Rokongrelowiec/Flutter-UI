import 'package:flutter/material.dart';
import 'package:chat/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(color: Colors.blueAccent)
        // secondaryHeaderColor: Colors.indigo[900],
      ),
      home: HomeScreen(),
    );
  }
}