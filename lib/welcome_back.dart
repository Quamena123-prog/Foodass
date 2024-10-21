import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_password.dart';
import 'sign_up.dart'; // Import the SignUp page
import 'landing_page.dart'; // Import the LandingPage

class WelcomeBack extends StatefulWidget {
  WelcomeBack({Key? key}) : super(key: key);

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _loadLoginInfo();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _loadLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null) {
      _emailController.text = email;
    }
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Mock authentication
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
                    'assets/images/amico.png', // Make sure the path is correct
                    width: 281, // Adjust the width as needed
                    height: 248, // Adjust the height as needed
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ), // Add some space between the image and the text
                Align(
                  alignment: Alignment.center, // Align to the center
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600, // Semi-bold
                        ),
                      ),
                      SizedBox(height: 8.0), // Space between the two texts
                      Text(
                        'Sign in with your email and password',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors
                              .grey, // Optional: set color to grey for the smaller text
                        ),
                      ),
                      SizedBox(
                          height: 32.0), // Space between text and text fields
                      // Email TextField
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email), // Icon for email
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: _validateEmail,
                      ),
                      SizedBox(height: 16.0), // Space between text fields
                      // Password TextField
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText, // Hide password
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock), // Icon for password
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                          height:
                              8.0), // Space between text field and forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Colors.red, // Set text color to red
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0), // Space before the login button
                      SizedBox(
                        width: double.infinity, // Make the button full-width
                        child: TextButton(
                          onPressed: () => _login(context),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Set background color to red
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0,
                            ), // Set padding for the button
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white, // Set text color to white
                              fontSize: 16.0, // Set text size
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0), // Space before the sign-up text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
