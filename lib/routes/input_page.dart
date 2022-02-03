import 'package:bmi_calculator/routes/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui_components/reusable_card.dart';
import '../ui_components/icon_content.dart';
import '../ui_components/calculate_button.dart';
import '../data/constants.dart';
import '../ui_components/roundiconbutton.dart';
import 'package:bmi_calculator/data/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//class for sending data to result screen
class ResultData {
  final String dataResult;
  final Text dataResultLabel;
  final String dataResultInfo;

  const ResultData(
      {@required this.dataResultLabel,
      @required this.dataResult,
      @required this.dataResultInfo});
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kSelectedCardColor;
  Color femaleCardColor = kActiveCardColor;
  Color maleIconColor = kActiveIconColor;
  Color femaleIconColor = kInactiveIconColor;
  bool genderIsMale = true;
  int height = 162;
  int waist = 75;
  int weight = 65;
  int age = 28;
  String result;
  Text resultLabel;
  String resultInfo;

  //set colors for selected gender and toggle bool genderIsMale
  void updateSelection(Gender genderType) {
    if (genderType == Gender.male) {
      maleCardColor = kSelectedCardColor;
      femaleCardColor = kActiveCardColor;
      maleIconColor = kActiveIconColor;
      femaleIconColor = kInactiveIconColor;
      genderIsMale = true;
    } else if (genderType == Gender.female) {
      maleCardColor = kActiveCardColor;
      femaleCardColor = kSelectedCardColor;
      maleIconColor = kInactiveIconColor;
      femaleIconColor = kActiveIconColor;
      genderIsMale = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Container(
          height: 600.0,
          child: Drawer(
            backgroundColor: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('BMI and WHtR:', style: drawerTitle),
                Divider(color: Colors.grey, indent: 8.0, endIndent: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Use this app to measure your BMI(body mass index) or'
                    'WHtR(waist to height ratio).',
                    style: drawerText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'BMI calculation:\n  [weight / (height/100)^2]',
                    style: drawerText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WHtR calculation:\n [waist / (height*agefactor]',
                    style: drawerText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WHtR also takes into account your sex and age.',
                    style: drawerText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(FontAwesomeIcons.questionCircle),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D101E),
        title: Text('BMI & WHtR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          updateSelection(Gender.male);
                        });
                      },
                      newColor: maleCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          iconColor: maleIconColor,
                          gender: 'male'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          updateSelection(Gender.female);
                        });
                      },
                      newColor: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconColor: femaleIconColor,
                        gender: 'female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                newColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kVariableTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: kActiveIconColor,
                      inactiveColor: Colors.grey,
                      value: height.toDouble(),
                      max: 225.0,
                      min: 100.0,
                      divisions: 125,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                newColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('WAIST', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          waist.toString(),
                          style: kVariableTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: kActiveIconColor,
                      inactiveColor: Colors.grey,
                      value: waist.toDouble(),
                      max: 180.0,
                      min: 30.0,
                      divisions: 150,
                      onChanged: (double newValue) {
                        setState(() {
                          waist = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      newColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: kVariableTextStyle)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight > 0 ? weight-- : weight = 0;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight < 200 ? weight++ : weight = 200;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      newColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(age.toString(), style: kVariableTextStyle)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age > 18 ? age-- : age = 18;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age < 70 ? age++ : age = 70;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                      child: CalculateButton(label: 'BMI', type: Calculate.bmi),
                      onTap: () {
                        CalculatorBrain calc = CalculatorBrain(
                            isMale: genderIsMale,
                            height: height,
                            waist: waist,
                            weight: weight,
                            age: age,
                            type: Calculate.bmi);
                        result = calc.getResult();
                        resultLabel = calc.getLabel();
                        resultInfo = calc.getInfo();
                        ResultData results = ResultData(
                            dataResultLabel: resultLabel,
                            dataResult: result,
                            dataResultInfo: resultInfo);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(resultData: results)));
                      }),
                ),
                Expanded(
                  child: GestureDetector(
                    child: CalculateButton(label: 'WHtR', type: Calculate.wthr),
                    onTap: () {
                      CalculatorBrain calc = CalculatorBrain(
                          isMale: genderIsMale,
                          height: height,
                          waist: waist,
                          weight: weight,
                          age: age,
                          type: Calculate.wthr);
                      result = calc.getResult();
                      resultLabel = calc.getLabel();
                      resultInfo = calc.getInfo();
                      ResultData results = ResultData(
                          dataResultLabel: resultLabel,
                          dataResult: result,
                          dataResultInfo: resultInfo);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultScreen(resultData: results)));
                    },
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
