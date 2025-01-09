import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/buttom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

// Enum to represent gender options
enum Gender { male, female }

// Main Input Page (stateful) where the UI is built
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

// State class that defines the structure and behavior of the InputPage
class _InputPageState extends State<InputPage> {
  Gender? selectedGender; // Currently selected gender

  // Variables for height (using feet and inches for easier interpretation)
  int vFeet = 4;
  int vInches = 0;
  double vHeightInMeter = 0; // Height in meters for BMI calculation

  // Variables for weight and age
  int vWeight = 30;
  int vAge = 15;

  // Helper method to convert height to formatted string (feet' inches")
  String _getFormattedHeight() {
    return '$vFeet\' $vInches"';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender selection row
          Expanded(
            child: Row(
              children: [
                // Male selection container
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male; // Set male as selected
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    containerChild: IconContent(
                      label: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                // Female selection container
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female; // Set female as selected
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    containerChild: IconContent(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Height selection container with slider
          Expanded(
            child: ReusableContainer(
              colour: kInactiveCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT", style: kLabelStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(_getFormattedHeight(), style: kNumberTextStyle),
                    ],
                  ),
                  // Slider for height adjustment (in inches)
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                      value: (vFeet * 12 + vInches).toDouble(), // Convert to total inches
                      min: 0,
                      max: 96, // 8 feet in inches
                      divisions: 96, // One division per inch up to 8 feet
                      label: _getFormattedHeight(), // Visual feedback on slide
                      onChanged: (double newValue) {
                        setState(() {
                          int totalInches = newValue.round(); // Convert to integer
                          vHeightInMeter = totalInches * 0.0254; // Convert inches to meters
                          vFeet = totalInches ~/ 12; // Calculate feet
                          vInches = totalInches % 12; // Calculate remaining inches
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          // Weight and Age selection containers
          Expanded(
            child: Row(
              children: [
                // Weight selection container
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(vWeight.toString(), style: kNumberTextStyle),
                            Text("  kg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Decrease weight button
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  if (vWeight > 0) {
                                    vWeight--; // Decrease weight
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            // Increase weight button
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  if (vWeight > 0) {
                                    vWeight++; // Increase weight
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Age selection container
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(vAge.toString(), style: kNumberTextStyle),
                            Text(' yrs')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Decrease age button
                            CircleButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (vAge > 0) {
                                      vAge--; // Decrease age
                                    }
                                  });
                                }),
                            SizedBox(width: 15),
                            // Increase age button
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  if (vAge < 130) {
                                    vAge++; // Increase age
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calculate BMI button
          ButtomButton(
              buttonText: "CALCULATE",
              onTap: () {
                // Create an instance of CalculatorBrain and calculate BMI
                CalculatorBrain calc = CalculatorBrain(weightInKG: vWeight, heightInMtr: vHeightInMeter);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                        bmi: calc.calculateBmi(),
                        bmiCategory: calc.getBmiCategory(),
                        bmiDescription: calc.getBmiDescription()
                    )));
              }),
        ],
      ),
    );
  }
}
