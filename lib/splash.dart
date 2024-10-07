import 'package:firstapplication/Onboarding2.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 8), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding2()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      return ResponsiveSizer(
        builder: (context, orientation, screenType) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/onboarding4.gif",
              fit: BoxFit.cover,// كدا الصوره هنا خلفيه واخده حجم الاسكرين كلها 
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Top text: "Welcome In My E-Commerce"
          const Positioned(
            top: 0, // Adjust the top position for the text
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome In My E-Commerce",
                style: TextStyle(
                  fontSize: 25,
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
            ),
          ),

          // Bottom text: "Developed By Maram Basyone"
          const Positioned(
            bottom: 10, // Adjust the bottom position for the text
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Developed By Maram Basyone",
                style: TextStyle(
                  fontSize: 19,
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
            ),
          ),
        ],
      ),
    );
        }
      );
  }
}
