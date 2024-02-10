// rent_page.dart
import 'package:flutter/material.dart';

class RentPage extends StatelessWidget {
  final List<Property> properties = [
    Property(
      name: 'Beautiful House',
      cost: '₹20000',
      location: 'City A',
      image: 'https://via.placeholder.com/300', // Placeholder URL, replace with actual image URL
    ),
    Property(
      name: 'Cozy Apartment',
      cost: '₹15000',
      location: 'City B',
      image: 'https://via.placeholder.com/300', // Placeholder URL, replace with actual image URL
    ),
    // Add more properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rent Page')),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PropertyItem(property: properties[index]);
        },
      ),
    );
  }
}

class Property {
  final String name;
  final String cost;
  final String location;
  final String image;

  Property({
    required this.name,
    required this.cost,
    required this.location,
    required this.image,
  });
}

class PropertyItem extends StatelessWidget {
  final Property property;

  PropertyItem({required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            property.image,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Cost: ${property.cost}'),
                Text('Location: ${property.location}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
