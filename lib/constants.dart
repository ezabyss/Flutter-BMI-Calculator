import 'package:flutter/material.dart';

// Constants for styling and layout used throughout the app

// Height of the bottom button container
const kButtonContainerHeight = 80.0;

// Background color for the bottom button container
const kButtonContainerColor = Colors.pinkAccent;

// Color for the active card (e.g., selected gender or highlighted section)
const kActiveCardColor = Color(0XFF1D1E33);

// Color for the inactive card (e.g., unselected gender or non-highlighted section)
const kInactiveCardColor = Color(0XFF111328);

// Text style for labels (e.g., "HEIGHT", "WEIGHT")
const kLabelStyle = TextStyle(
  fontSize: 18.0, // Slightly smaller text size
  color: Color(0xFF8D8E98), // Subtle grey color for labels
);

// Text style for numbers (e.g., weight, height, or age values)
const kNumberTextStyle = TextStyle(
  fontSize: 50.0, // Large text for emphasis
  fontWeight: FontWeight.w900, // Extra bold for readability
);

// Text style for the button text (e.g., "CALCULATE")
const kButtonTextStyle = TextStyle(
  fontSize: 30, // Large and bold for call-to-action buttons
  fontWeight: FontWeight.bold,
);

// Text style for the title on the result page (e.g., "Your Result")
const kTitleTextStyle = TextStyle(
  fontSize: 40, // Big, bold, and eye-catching
  fontWeight: FontWeight.bold,
);

// Text style for the BMI category indication (e.g., "Normal", "Overweight")
const kWeightIndicationStyle = TextStyle(
  fontSize: 28, // Slightly smaller than the main title
  fontWeight: FontWeight.bold, // Emphasis on the category
  color: Colors.green, // Green color to indicate positivity
);

// Text style for the BMI number display (e.g., "22.5")
const kBmiNumberStyle = TextStyle(
  fontSize: 70, // Large and bold for high visibility
  fontWeight: FontWeight.bold,
);

// Text style for suggestions or advice text (e.g., health tips based on BMI)
const kSuggestionStyle = TextStyle(
  letterSpacing: 1, // Slight spacing between letters for readability
  fontSize: 25, // Medium-large size for visibility
);
