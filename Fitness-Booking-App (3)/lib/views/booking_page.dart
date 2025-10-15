import 'package:flutter/material.dart';
import '../models/instructor.dart';
import '../widgets/custom_button.dart';
import '../services/booking_service.dart';

class BookingPage extends StatefulWidget {
  final Instructor instructor;

  const BookingPage({super.key, required this.instructor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final int ratePerHour = 150;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book ${widget.instructor.name}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.instructor.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Expertise: ${widget.instructor.expertise}"),
            Text("Location: ${widget.instructor.location}"),
            const SizedBox(height: 20),

            Text("Rate: ₱$ratePerHour / hour",
                style: const TextStyle(fontSize: 16, color: Colors.green)),
            const SizedBox(height: 20),

            // Date Picker
            Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? "No date selected"
                      : "Date: ${selectedDate!.toLocal().toString().split(' ')[0]}"),
                ),
                CustomButton(
                  text: "Pick Date",
                  onPressed: _pickDate,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Time Picker
            Row(
              children: [
                Expanded(
                  child: Text(selectedTime == null
                      ? "No time selected"
                      : "Time: ${selectedTime!.format(context)}"),
                ),
                CustomButton(
                  text: "Pick Time",
                  onPressed: _pickTime,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
            const Spacer(),

            // Confirm Booking
            Center(
              child: CustomButton(
                text: "Confirm Booking",
                backgroundColor: Colors.green,
                onPressed: () {
                  if (selectedDate == null || selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please select date and time")),
                    );
                    return;
                  }

                  // Save booking
                  bookings.add(Booking(
                    instructor: widget.instructor,
                    date: selectedDate!,
                    time: selectedTime!.format(context),
                    rate: ratePerHour,
                  ));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Booking confirmed for ${widget.instructor.name} at ₱$ratePerHour/hour!"),
                    ),
                  );

                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
