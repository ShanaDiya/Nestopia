import 'package:flutter/material.dart';
import 'main.dart';

class FindRoommatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Roommate Details'),
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
              'Roommate Name',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: Your Roommate Location', // Replace with your actual location data
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Looking for a roommate to share a cozy apartment. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement functionality for contacting or viewing more details about the roommate
              },
              child: Text('Contact Roommate'),
            ),
          ],
        ),
      ),
      // Include the bottom navigation bar
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/find_roommate'),
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
