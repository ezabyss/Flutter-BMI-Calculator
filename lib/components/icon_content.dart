import 'package:flutter/material.dart';
import '../constants.dart';

// Custom widget to display an icon and a label centered vertically
class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label; // Label text displayed below the icon
  final IconData icon; // Icon displayed above the label

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
      MainAxisAlignment.center, // Center items vertically
      children: <Widget>[
        Icon(icon, size: 80), // Display icon with specified size
        SizedBox(height: 15.0), // Add space between icon and label
        Text(
          label,
          style: kLabelStyle, // Apply predefined style for label
        ),
      ],
    );
  }
}
