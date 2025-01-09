import 'package:flutter/material.dart';

// A reusable container widget to avoid repetitive code (DRY Principle)
class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    super.key,
    required this.colour, // Color for the container background
    this.containerChild, // Child widget to display inside the container
    this.onPress, // Action to perform when the container is tapped
  });

  final Color colour; // Container's background color
  final Widget? containerChild; // Optional child widget to display inside
  final GestureTapCallback? onPress; // Optional tap handler

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Trigger onPress action when tapped
      child: Container(
        margin: EdgeInsets.all(10), // Add margin around the container
        decoration: BoxDecoration(
          color: colour, // Set the background color
          borderRadius: BorderRadius.circular(15), // Rounded corners for the container
        ),
        child: containerChild, // Display the child widget inside the container
      ),
    );
  }
}
