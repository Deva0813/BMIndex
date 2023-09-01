import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({Key?key,required this.height,required this.onChanged}):super(key:key);

  final int height;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kStaticCards,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height".toUpperCase(),
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white54,
                    fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500)
                        .fontFamily,
                    letterSpacing: 1.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.055,
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                    ).fontFamily,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "cm",
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: kAccentColor,
                overlayColor: const Color(0x29E10D51),
                activeTrackColor: kAccentColor,
                inactiveTrackColor: Colors.white54,
                thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 10.0),
                overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 20.0),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
