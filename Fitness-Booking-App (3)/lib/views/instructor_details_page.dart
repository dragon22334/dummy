import 'package:flutter/material.dart';
import '../models/instructor.dart';
import 'booking_page.dart';

class InstructorDetailsPage extends StatelessWidget {
  final Instructor instructor;

  const InstructorDetailsPage({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(instructor.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              instructor.imageUrl,
              height: 200,
              errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 200),
            ),
            const SizedBox(height: 16),
            Text(instructor.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(instructor.expertise, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('Location: ${instructor.location}',
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text(instructor.description),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookingPage(instructor: instructor)),
                );
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
