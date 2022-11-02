import 'package:flutter/material.dart';
import 'package:taskit_flutter/theme/constants.dart';

class UserButton extends StatelessWidget {
  UserButton({this.buttonTitle, this.colors, this.onPressed});

  String? buttonTitle;
  List<Color>? colors;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5.0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors!,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          height: 60,
          width: 180,
          alignment: Alignment.center,
          child: Text(
            buttonTitle!,
            style: kSignButtonStyle,
          ),
        ),
      ),
    );
  }
}
