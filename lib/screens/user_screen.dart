import 'package:flutter/material.dart';
import 'package:taskit_flutter/theme/constants.dart';
import 'package:taskit_flutter/widgets/elevated_button.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int imageNumber = 1;
  void toggleImageNumber() {
    if (imageNumber == 1) {
      setState(() {
        imageNumber = 2;
      });
    } else {
      setState(() {
        imageNumber = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: kBackgroundColors,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                'Task it!',
                style: kTextTopStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  toggleImageNumber();
                },
                child: Container(
                  child:
                      Image.asset('assets/images/astronaut-$imageNumber.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Start 👍 \nTask & Time Management!',
                        style: kContainerTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        UserButton(
                          buttonTitle: 'Sign in',
                          colors: [
                            Color(0xff4abdf5),
                            Color(0xff56c8ff),
                            Color(0xff56c8ff),
                            Color(0xff56c8ff),
                            Color(0xff4abdf5),
                          ],
                        ),
                        UserButton(
                          buttonTitle: 'Sign up',
                          colors: [
                            Color(0xffffab4a),
                            Color(0xffffc580),
                            Color(0xffffc580),
                            Color(0xffffc580),
                            Color(0xffffab4a),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
