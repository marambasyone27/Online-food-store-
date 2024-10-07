import 'package:firstapplication/Login.dart';
import 'package:firstapplication/enum.dart';
import 'package:flutter/material.dart';
// Ensure the path is correct
import 'package:firstapplication/Shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboarding2> {
  List<String> images = [
    "assets/images/onboarding2.gif",
    "assets/images/splash2.gif",
  ];

  List<String> texts = [
    "Pizza is a versatile dish known for its savory combination of a thin or thick crust topped with melted cheese, a rich tomato base, and a variety of ingredients like meats, vegetables, and herbs",
    "The hamburger is a classic comfort food featuring a juicy patty, usually made from beef, placed inside a soft bun, accompanied by layers of fresh lettuce, tomatoes, onions, pickles, and cheese",
  ];
  
  bool isLast = false;
  final PageController pageController = PageController();
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isLast = true;
                Shared.putBooLean(key: sharedKeys.isLastOnboarding, value: isLast);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>Login()),
                  (route) => false,
                );
              });
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoMono',
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded PageView to show images and text properly
          Expanded(
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  isLast = index == images.length - 1;
                  activePage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image Container with adjusted size
                      Container(
                        width: 600, // Adjust width as needed
                        height: 600, // Adjust height as needed
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text description under each image
                      Text(
                        texts[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // SmoothPageIndicator to indicate the active page
          SmoothPageIndicator(
            controller: pageController,
            count: images.length,
            effect: const JumpingDotEffect(
              dotHeight: 12,
              dotWidth: 12,
              jumpScale: 1.5,
              verticalOffset: 5,
              dotColor: Colors.grey,
              activeDotColor: Colors.indigo,
            ),
          ),
          const SizedBox(height: 20),
          // "Next" button visibility based on the last page
          Align(
            alignment: Alignment.bottomRight,
            child: Visibility(
              visible: isLast,
              child: ElevatedButton(
                onPressed: () {
                  Shared.putBooLean(key: sharedKeys.isLastOnboarding, value: isLast);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
