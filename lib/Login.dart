// login code

import 'package:firstapplication/Products.dart';
import 'package:firstapplication/Register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image covering the entire screen
          Positioned.fill(
            child: Image.asset(
             // "assets/images/onboarding1.jpg",
            // "assets/images/food1.jpg",
            "assets/images/pizza4.jpg",
          // "assets/images/food2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // The Form on top of the image
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey, 
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 223, 68, 6),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'RobotoMono',
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 223, 68, 6),
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                          prefixIcon: const Icon(Icons.email , color: Colors.white),
                        //rfilled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter A strong Password',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'RobotoMono',
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 223, 68, 6),
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: const Icon(Icons.remove_red_eye_rounded, color: Colors.white),
                          //filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      
                      MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final prefs = await SharedPreferences.getInstance();
                            String registeredEmail = prefs.getString('email') ?? '';
                            String registeredPassword = prefs.getString('password') ?? '';

                            if (emailController.text == registeredEmail &&
                                passwordController.text == registeredPassword) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Products()),
                              );
                            } else {
                              // If user is not registered, navigate to Register page to create an account
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("You don't have an account. Create An Account"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              });
                            }
                          }
                        },
                        color: Colors.orange,
                        textColor: Colors.white,
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 223, 68, 6),
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Create an Account Button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: const Text(
                          "Create an account?",
                       style: TextStyle(
                        color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'RobotoMono',
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 223, 68, 6),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
