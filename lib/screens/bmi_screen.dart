import 'package:bmi_calc/logic/bmi_logic.dart';
import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/widgets/card.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _InputPageState();
}

class _InputPageState extends State<BmiPage> {
  bool isMaleSelected = false;
  int height = 170;
  int weight = 60;
  int age = 18;

  void ageIncrement() {
    setState(() {
      age++;
    });
  }

  void ageDecrement() {
    setState(() {
      age--;
    });
  }

  void calculateBMIAndShowModal() {
    double bmi = weight / (height * height) * 10000;
    String bmiValue = bmi.toStringAsFixed(1);
    String result = getBMIResult(bmi);
    String feedback = getBMIFeedBack(bmi);
    Color backgroundColor = getBMIBackground(bmi);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          backgroundColor: backgroundColor,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              height: 800,
              color: backgroundColor,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Your BMI is:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiValue,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      result,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      feedback,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(color: kbackgroundColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'BMI Calculator',
          style: textTheme.headline2!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        titleSpacing: 20,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = true;
                  });
                },
                child: AppCard(
                  borderSide: isMaleSelected
                      ? const BorderSide(color: Colors.white70, width: 3)
                      : BorderSide.none,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.male,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Male',
                        style: isMaleSelected
                            ? textTheme.headline3!.copyWith(color: Colors.white)
                            : textTheme.headline5!
                                .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                  });
                },
                child: AppCard(
                  borderSide: isMaleSelected == false
                      ? const BorderSide(color: Colors.white70, width: 3)
                      : BorderSide.none,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.female,
                        color: Colors.pinkAccent,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Female',
                        style: isMaleSelected == false
                            ? textTheme.headline3!.copyWith(color: Colors.white)
                            : textTheme.headline5!
                                .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppCard(
              width: 370,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Height (in cm)',
                    style: textTheme.headline3!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  NumberPicker(
                    minValue: 120,
                    maxValue: 220,
                    value: height,
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    axis: Axis.horizontal,
                    itemCount: 5,
                    itemWidth: 60,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 29),
                        height: index == 2 ? 30 : 20,
                        width: 2,
                        color: index == 2 ? Colors.white : Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCard(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Weight (in kg)',
                      style: textTheme.headline3!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 80,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.18),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.withOpacity(.3),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          const Positioned(
                            bottom: 60,
                            child: RotatedBox(
                              quarterTurns: 45,
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                          Center(
                            child: NumberPicker(
                              minValue: 10,
                              maxValue: 200,
                              value: weight,
                              itemWidth: 40,
                              selectedTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              axis: Axis.horizontal,
                              onChanged: (newValue) {
                                setState(() {
                                  weight = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              AppCard(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Age',
                      style: textTheme.headline3!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              ageDecrement();
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white54,
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: textTheme.headline3!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '$age',
                          style: textTheme.headline1!
                              .copyWith(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ageIncrement();
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white54,
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+',
                                style: textTheme.headline3!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateBMIAndShowModal();
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Text(
          'Check',
          style:
              TextStyle(color: kbackgroundColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
