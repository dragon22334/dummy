import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widgets/custom_button.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://img.icons8.com/color/452/dumbbell.png',
                height: 120,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.fitness_center, size: 120),
              ),
              const SizedBox(height: 20),
              const Text(
                'FitConnect',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Find your perfect fitness instructor and book sessions with ease.\nStay fit, stay motivated!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              CustomButton(
                text: 'Book Now',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
