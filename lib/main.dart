import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';

import './constants/colors.dart';

import './screens/home_screen.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
        enabled: false,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracker',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: MyColors.PRIMARY_COLOR,
        accentColor: MyColors.ACCENT_COLOR,
        canvasColor: MyColors.CANVAS_COLOR,
        cardColor: MyColors.CARD_COLOR,
        buttonColor: MyColors.PRIMARY_COLOR,
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
            color: MyColors.FONT_MAIN_COLOR,
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 22,
          ),
          headline2: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
          headline3: GoogleFonts.quicksand(
            color: MyColors.FONT_MAIN_COLOR,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
          headline4: GoogleFonts.quicksand(
            color: MyColors.FONT_LIGHT_COLOR,
            fontSize: 32.0,
            fontWeight: FontWeight.w300,
          ),
          headline5: GoogleFonts.quicksand(
            color: MyColors.PRIMARY_COLOR,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
          headline6: GoogleFonts.quicksand(
            color: MyColors.FONT_LIGHT_COLOR,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
          subtitle2: GoogleFonts.quicksand(
            color: MyColors.FONT_MAIN_COLOR,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
          button: GoogleFonts.quicksand(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          bodyText1: GoogleFonts.quicksand(
            fontSize: 18.0,
            color: MyColors.FONT_LIGHT_COLOR,
            fontWeight: FontWeight.w600,
          ),
          bodyText2: GoogleFonts.quicksand(
            fontSize: 16.0,
            color: MyColors.FONT_LIGHT_COLOR,
            fontWeight: FontWeight.w300,
          ),
          caption: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
