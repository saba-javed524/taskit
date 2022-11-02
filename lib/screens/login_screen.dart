import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskit_flutter/screens/folders_and_tasks/tasks_folders_screen.dart';
import 'package:taskit_flutter/screens/signup_screen.dart';
import 'package:taskit_flutter/theme/constants.dart';
import 'package:taskit_flutter/widgets/elevated_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPassword = TextEditingController();

bool hiddenPassword = true;
passwordToggle() {
  if (hiddenPassword == true) {
    hiddenPassword = false;
  } else if (hiddenPassword == false) {
    hiddenPassword = true;
  }
}

clear() {
  controllerEmail.clear();
  controllerPassword.clear();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration(
              gradient: kBackgroundColors,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Expanded(
                    flex: 2, child: Image.asset('assets/images/astra-2.png')),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    decoration: kContainerDecoration,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Sign in', style: kContainerTextStyle),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            controller: controllerEmail,
                            cursorColor: kBlueColor,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            style: kTextfieldTextStyle,
                            textAlign: TextAlign.start,
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Email ID'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            controller: controllerPassword,
                            cursorColor: kBlueColor,
                            obscureText: hiddenPassword,
                            autofocus: false,
                            style: kTextfieldTextStyle,
                            textAlign: TextAlign.start,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Password',
                              icon: Icon(
                                Icons.lock_outline,
                                size: 30.0,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordToggle();
                                  });
                                  ;
                                },
                                icon: hiddenPassword
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.visibility_off),
                                iconSize: 25.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          UserButton(
                              buttonTitle: 'Sign in',
                              colors: kSigninButtonColors,
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final loggedInUser =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email!, password: password!);
                                  clear();
                                  if (loggedInUser != null) {
                                    Navigator.pushNamed(
                                        context, TaskFoldersScreen.id);
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New to Taskit?',
                                style: kSignButtonStyle.copyWith(
                                  color: kBlueColor,
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, SignUpScreen.id);
                                },
                                child: Text(
                                  'Sign up',
                                  style: kTextTopStyle.copyWith(
                                      fontSize: 18.0,
                                      color: Color(0xFF40B4EE),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
