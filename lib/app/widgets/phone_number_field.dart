import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneNumberField({super.key, required this.controller});

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String _selectedCountryCode = '+91'; // Default country code

  // List of country codes
  final List<String> _countryCodes = [
    '+90', '+91', '+92', '+44', '+61', '+86', // Add more country codes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xFF0E1115),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 70, // Increase width to fit longer country codes
            child: DropdownButtonFormField<String>(
              value: _selectedCountryCode,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountryCode = newValue!;
                });
              },
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              dropdownColor: Colors.black,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              items: _countryCodes.map((String countryCode) {
                return DropdownMenuItem<String>(
                  value: countryCode,
                  child: Text(
                    countryCode,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 8), // Add some space between dropdown and text field
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your mobile number',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
