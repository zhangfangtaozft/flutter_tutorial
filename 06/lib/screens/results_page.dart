import 'package:bmi_caculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage ({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text('Your Result', style: kTitleTextStyle),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,style: kResultTextStyle,),
                  Text(bmiResult, style: kBMITextStyle,),
                  Text(interpretation, style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RECALCULATR',
              onTap: () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
