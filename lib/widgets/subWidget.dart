import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class SubWidget extends StatelessWidget {
  const SubWidget(
      {Key? key,
      required this.title,
      required this.unit,
      required this.value,
      required this.onPressed1,
      required this.onPressed2,
      required this.margin})
      : super(key: key);

  final String title;
  final String unit;
  final int value;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: margin,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: kStaticCards,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500)
                        .fontFamily),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        letterSpacing: 1.0,
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                .fontFamily,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      unit,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: onPressed1,
                    fillColor: kSupportColor,
                    splashColor: Colors.transparent,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 50.0,
                      height: 50.0,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: kIconColor,
                      size: 35.0,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  RawMaterialButton(onPressed: onPressed2,
                    fillColor: kSupportColor,
                    splashColor: Colors.transparent,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 50.0,
                      height: 50.0,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: kIconColor,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
