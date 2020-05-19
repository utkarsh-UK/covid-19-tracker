import 'package:covid/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Widget> preventions = [
  Container(
    width: 150,
    height: 150,
    margin: const EdgeInsets.only(right: 12.0, top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(DISTANCING),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Avoid close contact',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  Container(
    width: 150,
    height: 150,
    margin: const EdgeInsets.only(right: 12.0, top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(WASHING),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Wash your hands often',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  Container(
    width: 150,
    height: 150,
    margin: const EdgeInsets.only(right: 12.0, top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(FACE),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Avoid touching your face',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  Container(
    width: 150,
    height: 150,
    margin: const EdgeInsets.only(right: 12.0, top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(CLEANING),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Make cleaning your top priority',
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
];
