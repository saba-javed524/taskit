import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskit_flutter/screens/folders_and_tasks/tasks_folders_screen.dart';
import 'package:taskit_flutter/screens/login_screen.dart';
import 'package:taskit_flutter/screens/signup_screen.dart';
import 'package:taskit_flutter/screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: UserScreen.id,
      routes: {
        UserScreen.id: (context) => UserScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        TaskFoldersScreen.id: (context) => TaskFoldersScreen(),
      },
    );
  }
}
