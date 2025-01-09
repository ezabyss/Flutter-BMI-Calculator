import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/buttom_button.dart';

class ResultsPage extends StatelessWidget {
  // Properties to hold BMI result, category, and description
  final String bmi;
  final String bmiCategory;
  final String bmiDescription;

  // Constructor to initialize the result data
  const ResultsPage({super.key, required this.bmi, required this.bmiCategory, required this.bmiDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"), // Title of the results page
      ),
      body: Column(
        // Use Column for vertical layout
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Header section displaying "Your Result"
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15), // Padding around the text
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result", // Title for the result section
                  style: kTitleTextStyle, // Use predefined style for the title
                  textAlign: TextAlign.left, // Align text to the left
                ),
              )),

          // Result display container
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(20), // Margin around the container
              color: kActiveCardColor, // Set background color
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space out content
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
                  children: <Widget>[
                    Text(bmiCategory, style: kWeightIndicationStyle), // Display BMI category (e.g., underweight, normal, etc.)
                    Text(
                      bmi,
                      style: kBmiNumberStyle, // Display the actual BMI number
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      bmiDescription, // Description of the BMI value (e.g., advice or health status)
                      style: kSuggestionStyle, // Predefined style for the suggestion text
                    ),
                  ]),
            ),
          ),

          // Button to navigate back and re-calculate BMI
          ButtomButton(
              buttonText: "RE-CALCULATE", // Text on the button
              onTap: () {
                Navigator.pop(context); // Navigate back to the input page
              }),
        ],
      ),
    );
  }
}
