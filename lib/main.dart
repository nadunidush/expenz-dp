import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenze",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter"),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Hello Expenze", style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
