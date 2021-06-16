import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Login App",
      home: Scaffold(
        body: LoginScreen(),
        // body: Text('Hello from App()'),
      ),
    );
  }
}
