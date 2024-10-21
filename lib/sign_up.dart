import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_back.dart'; // Import the WelcomeBack file
import 'landing_page.dart'; // Import the LandingPage file

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Save email and password
      String email = _emailController.text;
      String password = _passwordController.text;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);

      // Navigate to the LandingPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(),
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    const pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/dinner.png', // Make sure the path is correct
                    width: 243, // Adjust the width as needed
                    height: 251, // Adjust the height as needed
                  ),
                ),
                SizedBox(height: 16.0), // Add space between image and texts
                Text(
                  'Hi, there',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0), // Add space between texts
                Text(
                  'Sign up with your name, email, and password',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey, // Make the text less visible
                  ),
                ),
                SizedBox(
                    height: 32.0), // Add space between text and input fields
                // Name TextField
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), // Icon for name
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0), // Add space between input fields
                // Email TextField
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), // Icon for email
                    labelText: 'Enter your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: _validateEmail,
                ),
                SizedBox(height: 16.0), // Add space between input fields
                // Password TextField
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText, // Hide password
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), // Icon for password
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    height: 16.0), // Add space between input fields and button
                // Signup Button
                SizedBox(
                  width: double.infinity, // Make the button full-width
                  child: TextButton(
                    onPressed: () => _signUp(context),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Colors.red, // Set background color to red
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0), // Set padding for the button
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 16.0, // Set text size
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add space before the login text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WelcomeBack(), // Navigate to WelcomeBack page
                          ),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
