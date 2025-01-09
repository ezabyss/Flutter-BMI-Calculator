import 'dart:math';

class CalculatorBrain {
  final int weightInKG;
  final double heightInMtr;

  // Constructor
  CalculatorBrain({required this.weightInKG, required this.heightInMtr}) {
    if (weightInKG <= 0 || heightInMtr <= 0) {
      throw ArgumentError("Weight and height must be positive non-zero values.");
    }
  }

  // BMI Calculation Getter
  double get bmi => weightInKG / pow(heightInMtr, 2);

  // Calculate BMI as a formatted string
  String calculateBmi() => bmi.toStringAsFixed(2);

  // Determine BMI Category
  String getBmiCategory() {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Overweight";
    if (bmi < 34.9) return "Obese Class I";
    if (bmi < 39.9) return "Obese Class II";
    return "Obese Class III";
  }

  // Get BMI Description using a map for cleaner extendability
  String getBmiDescription() {
    const descriptions = {
      "Underweight": "You have a lower body weight than normal. Consider a balanced diet.",
      "Normal": "Great job! You have a healthy weight. Keep maintaining your lifestyle.",
      "Overweight": "Your weight is higher than normal. Aim for regular exercise and balanced meals.",
      "Obese Class I": "You are in the obese range. Focus on healthier habits to lower your weight.",
      "Obese Class II": "This is a high obesity level. Consult a healthcare provider for guidance.",
      "Obese Class III": "This is severe obesity. Seek medical attention to manage your health risks."
    };
    return descriptions[getBmiCategory()] ?? "Invalid category.";
  }
}
