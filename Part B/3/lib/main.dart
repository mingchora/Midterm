import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NameGreetingApp(),
    );
  }
}

class NameGreetingApp extends StatefulWidget {
  @override
  _NameGreetingAppState createState() => _NameGreetingAppState();
}

class _NameGreetingAppState extends State<NameGreetingApp> {
  final TextEditingController _nameController = TextEditingController();
  String _greeting = '';

  void _showGreeting() {
    setState(() {
      String name = _nameController.text.trim();
      if (name.isNotEmpty) {
        _greeting = 'Hello, $name!';
      } else {
        _greeting = 'Please enter your name!';
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Greeting App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
                hintText: 'Type your name here',
              ),
              onSubmitted: (_) => _showGreeting(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showGreeting,
              child: Text('Say Hello'),
            ),
            SizedBox(height: 30),
            Text(
              _greeting,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}