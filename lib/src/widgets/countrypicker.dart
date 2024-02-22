import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String selectedCountry = 'United States'; // Default selected country

  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Japan',
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: DropdownButton<String>(
            value: selectedCountry,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedCountry = newValue;
                });
              }
            },
            items: countries.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
