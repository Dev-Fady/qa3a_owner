
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qa3a_owner/features/onboarding/models/onboarding_model.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({
    super.key,
    required this.data,
  });

  final OnboardingModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// image
        Expanded(
          flex: 2,
          child: Image.asset(
            data.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
    
        /// text
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
    
                const SizedBox(height: 10),
    
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
