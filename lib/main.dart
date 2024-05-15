import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saver/firebase_options.dart';
import 'package:saver/pages/Dashboard-Pages/Add-Income-Screen.dart';
import 'package:saver/pages/Dashboard-Pages/Dashboard-Screen.dart';
import 'package:saver/pages/Intro-Screen-Pages/Intro-Screen.dart';
import 'package:saver/pages/Login-Form-Pages/Login_Intro.dart';
import 'package:saver/pages/constants.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: mainTextColor,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: mainTextColor,
          )
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF12211E),
          fill: 1,
          weight: 400,
          opticalSize: 48
        )
      ),
      debugShowCheckedModeBanner: false,
      //temporarily changed to dashboard (intro1 ni before)
      home: AddIncome(),
    );
  }
}
