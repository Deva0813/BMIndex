import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String bmi = data!['bmi'];
    final String result = data['result'];
    final int textColor = int.parse(data['textColor']) ;
    final String range = data['range'];
    final String interpretation = data['interpretation'];

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('BMI CALCULATOR '),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
                fontSize: 35.0,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: kActiveCard,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Color(textColor)
                      ),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                      ),
                    ),
                    Text(
                      "$result BMI range:",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: kTextColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "$range kg/m2",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w400)
                                  .fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              "RE-CALCULATE YOUR BMI",
              style: TextStyle(
                  color: Colors.white, fontSize: 20.0, letterSpacing: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
