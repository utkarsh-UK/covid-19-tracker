import 'package:covid/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Widget> preventions = [
  Container(
    alignment: Alignment.topCenter,
    width: 60,
    height: 40,
    margin: const EdgeInsets.only(right: 12.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(DISTANCING),
        fit: BoxFit.contain,
      ),
    ),
    child: Text(
      'Avoid close contact',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  Container(
    alignment: Alignment.topCenter,
    width: 60,
    height: 40,
    margin: const EdgeInsets.only(right: 12.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(DISTANCING),
      ),
    ),
    child: Text(
      'Clean your hands often',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  Container(
    alignment: Alignment.topCenter,
    width: 60,
    height: 40,
    margin: const EdgeInsets.only(right: 12.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(DISTANCING),
      ),
    ),
    child: Text(
      'Wear a facemask',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  Container(
    alignment: Alignment.topCenter,
    width: 60,
    height: 40,
    margin: const EdgeInsets.only(right: 12.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(DISTANCING),
      ),
    ),
    child: Text(
      'Make cleaning a top priority',
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
];
