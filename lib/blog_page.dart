// blog_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        // Customize the app bar as needed
      ),
      body: Column(
        children: [
          BlogItem(
            name: 'Exploring Beautiful Places',
            cost: 'Free',
            location: 'Various Locations',
            image: 'blog_image_1.jpg',
          ),
          BlogItem(
            name: 'Tips for a Cozy Home',
            cost: 'Free',
            location: 'Your Home',
            image: 'blog_image_2.jpg',
          ),
          // Add more BlogItems as needed
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/blogs'), // Add this line
    );
  }
}

class BlogItem extends StatelessWidget {
  final String name;
  final String cost;
  final String location;
  final String image;

  const BlogItem({
    required this.name,
    required this.cost,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/$image', height: 200, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Cost: $cost\nLocation: $location',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Read More" button click
                  },
                  child: Text('Read More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
