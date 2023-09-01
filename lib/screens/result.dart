import 'package:flutter/material.dart';
import '../constants/constants.dart';

class Results extends StatelessWidget {
  const Results({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('BMI'),
        ),
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
              Navigator.pop(context);
            },
            child: const Text(
              "RE-CALCULATE",
              style: TextStyle(
                  color: Colors.white, fontSize: 20.0, letterSpacing: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
