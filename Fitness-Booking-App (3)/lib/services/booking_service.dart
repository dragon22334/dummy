import '../models/instructor.dart';

class Booking {
  final Instructor instructor;
  final DateTime date;
  final String time;
  final int rate;

  Booking({
    required this.instructor,
    required this.date,
    required this.time,
    required this.rate,
  });
}

List<Booking> bookings = [];
