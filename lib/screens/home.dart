import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedGender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Padding(
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
                      color: selectedGender == "Male"
                          ? const Color(0xff6061be)
                          : const Color(0xff171930),
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
                          ? const Color(0xff6061be)
                          : const Color(0xff171930),
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
              child: Container(
                margin: const EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff0c122f),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Hello $selectedGender"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 10.0, 15.0, 10.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xff0c122f),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Hello"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 10.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xff0c122f),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Hello"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black38,
                    backgroundColor: const Color(0xffE10D51),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),

                  ),
                  onPressed: () {
                    debugPrint("pressed");
                  },
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20.0, letterSpacing: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.margin,
      required this.onPressed,
      required this.color})
      : super(key: key);

  final String text;
  final IconData icon;
  final EdgeInsets margin;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: margin,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Icon(
                  icon,
                  //Auto resize
                  size: MediaQuery.of(context).size.width * 0.3,
                  color: const Color(0xffcdcdd1),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    text.toUpperCase(),
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
