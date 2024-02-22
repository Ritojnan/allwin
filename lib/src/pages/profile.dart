import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> allergies = [
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Peanuts',
    'Shellfish',
    'Milk',
    'Eggs',
    'Wheat',
    'Soy',
    // Add more allergies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/avatar.png'), // Replace this with your avatar image
            ),
            SizedBox(height: 20),
            Text(
              'Allergies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allergies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(allergies[index]),
                    // You can add more details or actions for each allergy
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
