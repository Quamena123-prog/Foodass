import 'package:flutter/material.dart';
import 'first_splash.dart'; // Import the new screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(), // Set the initial screen
      routes: {
        '/firstSplash': (context) => const FirstSplash(), // Define the route
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, '/firstSplash'); // Navigate to the new screen
          },
          child: Image.asset(
            'assets/images/Log.png',
          ),
        ),
      ),
    );
  }
}
