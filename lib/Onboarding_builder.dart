import 'package:flutter/cupertino.dart';

class OnboardingBuilder extends StatelessWidget {
  final String imagePath;
  final String text;

  const OnboardingBuilder(
    {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Image.asset(imagePath), 
          const SizedBox(height: 20),   
          Text(
            text,
            textAlign: TextAlign.center, 
          ),
        ],
      ),
    );
  }
}
