import 'package:flutter/material.dart';
import 'main.dart';

class PutUpListingPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
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
                'Put Up Listing',
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
      bottomNavigationBar: MyBottomNavigationBar(currentRoute: '/put_up_listing'),
    );
  }
}
