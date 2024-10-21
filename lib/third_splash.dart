import 'package:flutter/material.dart';
import 'welcome_back.dart';

class ThirdSplash extends StatelessWidget {
  const ThirdSplash({super.key});

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
                'assets/images/Quality.png', // Make sure the path is correct
                width: 283, // Adjust the width as needed
                height: 405, // Adjust the height as needed
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeBack()),
                  );
                  // Handle Get Started action
                  print('Get Started button tapped');
                  // You can navigate to another screen or perform any action here
                },
                text: 'Get Started',
                backgroundColor: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Make the button take the full width
        padding:
            EdgeInsets.symmetric(vertical: 16.0), // Adjust padding for height
        decoration: BoxDecoration(
          color: backgroundColor, // Button background color
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Text color
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ThirdSplash(),
  ));
}
