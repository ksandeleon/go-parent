// ignore_for_file: unused_import, duplicate_import

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:go_parent/services/database/firebase_options.dart';
import 'package:go_parent/screens/login_page/login_screen.dart';
import 'package:go_parent/screens/login_page/password_recovery_screen.dart';
import 'package:go_parent/screens/signup_page/signup_screen.dart';
import 'package:go_parent/Screen/profile_screen.dart';
import 'package:go_parent/screens/home_page/home_screen.dart';
import 'package:go_parent/services/database/local/sqlite.dart';
import 'package:go_parent/widgets/side_menu.dart';
import 'package:go_parent/screens/welcome_page/welcome_screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/welcome_page/splash_screen.dart';
import 'screens/mission_page/mission_screen.dart';
import 'services/database/local/sqlite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
 );

  

  


  // Initialize sqflite for desktop platforms
  if (kIsWeb == false && (defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; // Set the database factory to ffi
  }

  // Initialize the database
  await DatabaseService.instance.database;

  print("Database initialized");

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GO PARENT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return WelcomeScreen(); // Update this with the correct screen
      //     } else if (snapshot.hasData) {
      //       return WelcomeScreen(); // Update this with the correct screen
      //     } else {
      //       return WelcomeScreen();
      //     }
      //   },
      // ),
      initialRoute: 'login_screen',
      routes: {
        // GalleryScreen.id: (context) => GalleryScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(), // welcome_screen
        LoginPage1.id: (context) => LoginPage1(), // login_screen
        Signup.id: (context) => Signup(), //id = "signup_screen""
       // home_screen
        PasswordRecovery.id: (context) => PasswordRecovery(), //password_recovery_screen
      },
    );
  }
}
