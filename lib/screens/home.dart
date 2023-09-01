import 'package:bmi_calc/widgets/heightWidget.dart';
import 'package:bmi_calc/widgets/subWidget.dart';
import 'package:flutter/material.dart';
import '../widgets/genderWidget.dart';
import '../constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedGender = "";
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                GenderWidget(
                    text: "Male",
                    icon: Icons.male,
                    margin: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
                    color:
                        selectedGender == "Male" ? kActiveCard : kInactiveCard,
                    onPressed: () {
                      setState(() {
                        selectedGender = "Male";
                      });
                    }),
                GenderWidget(
                    text: "Female",
                    icon: Icons.female,
                    margin: const EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 10.0),
                    color: selectedGender == "Female"
                        ? kActiveCard
                        : kInactiveCard,
                    onPressed: () {
                      setState(() {
                        selectedGender = "Female";
                      });
                    }),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: HeightWidget(
              height: height,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SubWidget(
                    title: "Weight",
                    unit: "kg",
                    value: weight,
                    margin: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 30.0),
                    onPressed1: () {
                      setState(() {
                        weight > 5 ? weight-- : weight = 5;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        weight++;
                      });
                    }),
                SubWidget(
                    title: "Age",
                    unit: "yrs",
                    value: age,
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 30.0),
                    onPressed1: () {
                      setState(() {
                        age > 2 ? age-- : age = 2;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        age++;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          color: kAccentColor,
          height: MediaQuery.of(context).size.height * 0.07,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black38,
              backgroundColor: kAccentColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            onPressed: () {

              if (selectedGender == "") {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("BMI Calculator"),
                        backgroundColor: kActiveCard,
                        content: const Text("Please select Gender"),
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15.0)),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: const Text("OK"))
                        ],
                      );
                    });
              } else {
                Navigator.pushNamed(context,"/result" );
              }
            },
            child: const Text(
              "CALCULATE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 1.0),
            ),
          ),
        ),
      ),

    );
  }
}
