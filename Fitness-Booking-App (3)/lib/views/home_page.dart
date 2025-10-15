import 'package:flutter/material.dart';
import '../models/instructor.dart';
import '../services/mock_data.dart';
import 'package:helloworld/views/instructor_details_page.dart';
import 'my_bookings_page.dart';
import '../widgets/custom_button.dart';
import 'material_cupertino_page.dart'; // <-- import the demo page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLocation = "All";

  @override
  Widget build(BuildContext context) {
    List<Instructor> filteredInstructors = selectedLocation == "All"
        ? mockInstructors
        : mockInstructors.where((i) => i.location == selectedLocation).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Fitness Instructor Booking")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text("All Instructors"),
              onTap: () {
                setState(() => selectedLocation = "All");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Bacolod"),
              onTap: () {
                setState(() => selectedLocation = "Bacolod");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Talisay"),
              onTap: () {
                setState(() => selectedLocation = "Talisay");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Silay"),
              onTap: () {
                setState(() => selectedLocation = "Silay");
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("My Bookings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyBookingsPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Material vs Cupertino Demo"), // <-- new link
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MaterialCupertinoPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: filteredInstructors.length,
        itemBuilder: (context, index) {
          final instructor = filteredInstructors[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(instructor.imageUrl),
              ),
              title: Text(instructor.name),
              subtitle:
                  Text("${instructor.expertise} • ${instructor.location}"),
              trailing: CustomButton(
                text: "View",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          InstructorDetailsPage(instructor: instructor),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
