import 'package:flutter/material.dart';
import 'main.dart';

class ListingForRoommatePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _roommatesController = TextEditingController();
  final TextEditingController _preferenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: Text(
                'Listing for Roommate',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicNeue',
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name:'),
                  TextField(controller: _nameController),
                  SizedBox(height: 10.0),
                  Text('House Name:'),
                  TextField(controller: _houseNameController),
                  SizedBox(height: 10.0),
                  Text('Cost:'),
                  TextField(controller: _costController),
                  SizedBox(height: 10.0),
                  Text('Location:'),
                  TextField(controller: _locationController),
                  SizedBox(height: 10.0),
                  Text('Number of Roommates:'),
                  TextField(controller: _roommatesController),
                  SizedBox(height: 10.0),
                  Text('Preference (Optional):'),
                  TextField(controller: _preferenceController),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement logic to save the listing
                    },
                    child: Text('Submit Listing'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/listing_for_roommate'),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Nestopia',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'ComicNeue',
        ),
      ),
      backgroundColor: Colors.lightBlue[800],
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

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
            icon: Icon(Icons.house),
            onPressed: () {
              if (currentRoute != '/rent') {
                Navigator.pushNamed(context, '/rent');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.apartment),
            onPressed: () {
              if (currentRoute != '/pg') {
                Navigator.pushNamed(context, '/pg');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              if (currentRoute != '/find_roommate') {
                Navigator.pushNamed(context, '/find_roommate');
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.book),
            onPressed: () {
              if (currentRoute != '/listing_for_roommate') {
                Navigator.pushNamed(context, '/listing_for_roommate');
              }
            },
          ),
        ],
      ),
    );
  }
}
