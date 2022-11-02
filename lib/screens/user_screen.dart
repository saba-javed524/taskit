import 'package:flutter/material.dart';
import 'package:taskit_flutter/screens/login_screen.dart';
import 'package:taskit_flutter/screens/signup_screen.dart';
import 'package:taskit_flutter/theme/constants.dart';
import 'package:taskit_flutter/widgets/elevated_button.dart';

class UserScreen extends StatefulWidget {
  static String id = 'user';
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: kBackgroundColors,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0),
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
                child: Image.asset('assets/images/astronaut-$imageNumber.png'),
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
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            colors: kSigninButtonColors),
                        UserButton(
                          buttonTitle: 'Sign up',
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          colors: kSignupButtonColors,
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
