import 'package:flutter/material.dart';
import '../constants.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({
    super.key,
    required this.buttonText, // Text to display on the button
    required this.onTap, // Callback function to trigger on tap
  });

  final String buttonText; // Text content for the button
  final VoidCallback? onTap; // Action to execute when the button is tapped

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Detect tap and trigger the onTap action
      child: Container(
        height: kButtonContainerHeight, // Set the height of the button container
        color: kButtonContainerColor, // Apply the background color for the button
        width: double.infinity, // Make the button span the full width of the screen
        child: Center(
            child: Text(
              buttonText, // Display the button's text in the center
              style: kButtonTextStyle, // Apply predefined button text style
            )),
      ),
    );
  }
}
