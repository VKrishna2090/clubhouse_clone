import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcome/welcome_page.dart';
import 'utils/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Clubhouse ",
      theme: ThemeData(
        scaffoldBackgroundColor: Style.LightBrown,
        fontFamily: GoogleFonts.nunito().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Style.LightBrown,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
