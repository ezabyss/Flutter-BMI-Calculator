import 'package:flutter/material.dart';

// CircleButton is a custom widget that represents a circular button with an icon inside it.
// It takes an icon and an optional onTap callback function.
class CircleButton extends StatelessWidget {
  final IconData icon; // The icon to be displayed inside the button.
  final VoidCallback? onTap; // The callback function to be executed when the button is pressed.

  // Constructor for the CircleButton. The icon is required, but onTap is optional.
  const CircleButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    // RawMaterialButton is used here to create a custom circular button.
    // The shape, fillColor, constraints, and child are all customized.
    return RawMaterialButton(
      shape: CircleBorder(), // Circular shape for the button.
      fillColor: Color(0xFF4C4F5E), // Button color (a shade of grey).
      onPressed: onTap, // Executes the onTap function when the button is pressed.
      constraints: const BoxConstraints.tightFor(
        width: 56.0, // The width of the button.
        height: 56.0, // The height of the button.
      ),

      child: Icon(icon), // The icon inside the button.
    );
  }
}
