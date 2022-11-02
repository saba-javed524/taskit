import 'package:flutter/material.dart';
import 'package:taskit_flutter/screens/folders_and_tasks/tasks_folders_screen.dart';
import 'package:taskit_flutter/screens/login_screen.dart';
import 'package:taskit_flutter/theme/constants.dart';
import 'package:taskit_flutter/widgets/elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "Signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerName = TextEditingController();
TextEditingController controllerPassword = TextEditingController();

bool hiddenPassword = true;
passwordToggle() {
  if (hiddenPassword == true) {
    hiddenPassword = false;
  } else if (hiddenPassword == false) {
    hiddenPassword = true;
  }
}

void clear() {
  controllerEmail.clear();
  controllerName.clear();
  controllerPassword.clear();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? name;
  String? password;
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

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
                  flex: 2,
                  child: Image.asset('assets/images/astra-1.png'),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: kContainerDecoration,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Sign up', style: kContainerTextStyle),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            onChanged: ((value) {
                              email = value;
                            }),
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
                              name = value;
                            },
                            controller: controllerName,
                            cursorColor: kBlueColor,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            style: kTextfieldTextStyle,
                            textAlign: TextAlign.start,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Full Name',
                              icon: Icon(
                                Icons.person_outline,
                                size: 30.0,
                                color: Colors.grey,
                              ),
                            ),
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
                            buttonTitle: 'Sign up',
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email!, password: password!);
                                clear();
                                if (newUser != null) {
                                  Navigator.pushNamed(
                                      context, TaskFoldersScreen.id);
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            colors: kSignupButtonColors,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Joined us before?',
                                style: kSignButtonStyle.copyWith(
                                  color: kBlueColor,
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                },
                                child: Text(
                                  'Sign in',
                                  style: kTextTopStyle.copyWith(
                                      fontSize: 18.0,
                                      color: Color(0xffffab4a),
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
