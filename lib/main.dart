import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/overview_screen.dart';
import 'screens/splash_screen.dart';
import '/screens/auth_screen.dart';
import '/screens/overview_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA9hl9T5bfFFRoEVXD1hIDVaaSVVahXuwM", // Your apiKey
      appId: "1:458975933041:android:a9c3c87bf10f83c508a1d0", // Your appId
      messagingSenderId: "458975933041", // Your messagingSenderId
      projectId: "xyloinc-database", // Your projectId
    ),

  );

  runApp(new
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Application',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            backgroundColor: Colors.white,
            // ignore: deprecated_member_use
            accentColor: Colors.deepPurple,
            // ignore: deprecated_member_use
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ))),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (userSnapshot.hasData) {
              return const OverviewScreen();
            }
            return const AuthScreen();
          },
        ));
  }
}





