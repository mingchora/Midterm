import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../widgets/info_row.dart';
import 'screen1.dart';

class Screen3 extends StatelessWidget {
  final UserData userData;

  const Screen3({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade100, Colors.blue.shade100],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 60,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Information Submitted Successfully!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Display User Information using reusable widget
                  InfoRow(
                    label: 'Name',
                    value: userData.name,
                    icon: Icons.person,
                  ),
                  InfoRow(
                    label: 'Age',
                    value: userData.age,
                    icon: Icons.cake,
                  ),
                  InfoRow(
                    label: 'Email',
                    value: userData.email,
                    icon: Icons.email,
                  ),

                  const SizedBox(height: 40),

                  // Back to Home Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Screen1()),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}