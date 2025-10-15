import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialCupertinoPage extends StatelessWidget {
  const MaterialCupertinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Material vs Cupertino")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Material Design (Android)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Material Button Pressed")),
                );
              },
              child: const Text("Material Button"),
            ),
            const Divider(height: 40),
            const Text(
              "Cupertino Design (iOS)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: const Text("Cupertino Alert"),
                    content: const Text("This is an iOS style dialog."),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Cupertino Button"),
            ),
          ],
        ),
      ),
    );
  }
}
