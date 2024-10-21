import 'package:flutter/material.dart';
import 'package:fudapp/third_splash.dart';

class SecondSplash extends StatelessWidget {
  const SecondSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/Foodas logo.png', // Make sure the path is correct
                width: 150, // Adjust the width as needed
                height: 150, // Adjust the height as needed
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center, // Align to the center
              child: Image.asset(
                'assets/images/Fast.png', // Make sure the path is correct
                width: 283, // Adjust the width as needed
                height: 405, // Adjust the height as needed
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle skip action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button background color
                    foregroundColor: Colors.black, // Text color
                    //side: BorderSide(color: Colors.black), // Optional: Add a border to make the button more visible
                  ),
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdSplash()),
                    );

                    // Handle next action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button background color
                    foregroundColor: Colors.white, // Text color
                  ),
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
