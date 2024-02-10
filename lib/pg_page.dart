import 'package:flutter/material.dart';
import 'main.dart';

class PGPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PG Details'),
        // You can customize the app bar as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace the Image.network placeholder with your actual image URL
            Image.network(
              'https://example.com/your_image.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'PG Name',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Cost: ₹1500', // Replace with your actual cost data
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: Your PG Location', // Replace with your actual location data
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement booking functionality for PG
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
      // Include the bottom navigation bar
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/pg'),
    );
  }
}

// Your existing MyBottomNavigationBar widget
class MyBottomNavigationBar extends StatelessWidget {
  final String currentRoute;

  const MyBottomNavigationBar({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlue[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              if (currentRoute != '/') {
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              if (currentRoute != '/saved') {
                Navigator.pushNamed(context, '/saved');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              if (currentRoute != '/chatbot') {
                Navigator.pushNamed(context, '/chatbot');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              if (currentRoute != '/myprofile') {
                Navigator.pushNamed(context, '/myprofile');
              }
            },
          ),
        ],
      ),
    );
  }
}
