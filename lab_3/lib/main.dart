import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showImage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("lab_3"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Displaying network image
              Image.network(
                "https://picsum.photos/250?image=9",
              ),
              const SizedBox(height: 40),
              
              // Displaying asset image with different BoxFit
              Image.asset(
                "assets/images/1.jpeg",
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Experiment with different BoxFit values
              ),
              const SizedBox(height: 20),
              
              // Stack widget with text overlay
              buildStack(),
              
              // Buttons
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the Stack widget with a semi-transparent container
  Widget buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background image
        Image.asset(
          "assets/images/1.jpeg",
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
        // Semi-transparent container overlay
        Container(
          width: 300,
          height: 300,
          color: Colors.black.withOpacity(0.5),
        ),
        // Text overlay
        const Text(
          "Welcome to Flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Method to build the buttons (ElevatedButton, TextButton, OutlinedButton)
  Widget buildButtons() {
    return Column(
      children: [
        // ElevatedButton
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('SnackBar is shown')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,      // Button color
            foregroundColor: Colors.white,     // Text color
            minimumSize: const Size(200, 50),  // Button size
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Show SnackBar"),
        ),
        const SizedBox(height: 20),
        
        // TextButton
        TextButton(
          onPressed: () {
            // Navigate to second screen (if implemented)
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,      // Text color
            minimumSize: const Size(200, 50),    // Button size
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Go to Second Screen"),
        ),
        const SizedBox(height: 20),
        
        // OutlinedButton
        OutlinedButton(
          onPressed: () {
            setState(() {
              _showImage = !_showImage; // Toggle image visibility
            });
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,             // Text color
            side: const BorderSide(color: Colors.black), // Border color
            minimumSize: const Size(200, 50),          // Button size
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Toggle Image"),
        ),
        const SizedBox(height: 20),

        // Conditionally show or hide image
        _showImage
            ? Image.asset(
                "assets/images/1.jpeg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
            : Container(), // If image is hidden, show an empty container
      ],
    );
  }
}