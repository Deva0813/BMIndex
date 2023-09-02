import 'package:flutter/material.dart';
import '../constants/constants.dart';

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
      child: AnimatedContainer(
        margin: margin,
        width: double.infinity,
        height: double.infinity,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            animationDuration: const Duration(milliseconds: 300),
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Icon(
                  icon,
                  //Auto resize
                  size: MediaQuery.of(context).size.height * 0.15,
                  color: kIconColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  text.toUpperCase(),
                  style: const TextStyle(fontSize: 16.0, color: Colors.white54, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
