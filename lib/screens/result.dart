import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String bmi = data!['bmi'];
    final String result = data['result'];
    final int textColor = int.parse(data['textColor']);
    final String range = data['range'];
    final String interpretation = data['interpretation'];

    ScreenshotController screenshotController = ScreenshotController();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('BMIndex'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontFamily:"Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 35.0,
              ),
            ),
            Expanded(
              child: resultCard(result, textColor, bmi, range, interpretation,
                  screenshotController, true),
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

  Container resultCard(
      String result,
      int textColor,
      String bmi,
      String range,
      String interpretation,
      ScreenshotController screenshotController,
      bool isShare) {
    return Container(
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
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Color(textColor)),
          ),
          Text(
            bmi,
            style: const TextStyle(
              fontSize: 100.0,
              fontFamily:"Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "$result BMI range:",
            style: const TextStyle(
              fontSize: 18.0,
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
            padding: const EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
            child: Text(
              interpretation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.0,
                fontFamily:
                "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          isShare
              ? TextButton(
                  onPressed: () async {
                    // final image = await screenshotController.capture();
                    final image = await screenshotController.captureFromWidget(
                    Container(
                      height: 600.0,
                      width: 400.0,
                      child: resultCard(result, textColor, bmi, range,
                          interpretation, screenshotController, false),
                    )
                    );
                    final directory = await getApplicationDocumentsDirectory();
                    final imagePath =
                        await File('${directory.path}/screenshot.png').create();
                    await imagePath.writeAsBytes(image);
                    await Share.shareXFiles([XFile(imagePath.path)],
                        text: "My BMI is $bmi and I am $result.\n "
                            "Download BMI Calculator from GitHub: \n"
                            "https://github.com/Deva0813/bmi_calc");
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black38,
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                    backgroundColor: kStaticCards,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: Text(
                    "Share Result".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "Poppins",
                        letterSpacing: 1.0),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
