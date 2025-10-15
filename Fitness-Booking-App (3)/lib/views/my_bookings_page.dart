import 'package:flutter/material.dart';
import '../services/booking_service.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: bookings.isEmpty
          ? const Center(child: Text("No bookings yet"))
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(booking.instructor.imageUrl),
                    ),
                    title: Text(booking.instructor.name),
                    subtitle: Text(
                        "${booking.instructor.expertise} • ${booking.instructor.location}\nDate: ${booking.date.toLocal().toString().split(' ')[0]} • Time: ${booking.time}"),
                    trailing: Text("₱${booking.rate}"),
                  ),
                );
              },
            ),
    );
  }
}
