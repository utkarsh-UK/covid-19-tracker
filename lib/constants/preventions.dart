import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/assets.dart';

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

final List<Map> precautions = [
  {
    'title': 'Wash Your Hands',
    'body':
        'Wash your hands with clean, running water (warm or cold), turn off the tap, and apply soap',
    'image': 'assets/images/washing_hands.png',
    'bg_color': Color(0xFFFFECB3),
    'title_color': Color(0xFFffab00),
  },
  {
    'title': 'Avoid Touching Your Face',
    'body':
        'Wash your hands with clean, running water (warm or cold), turn off the tap, and apply soap',
    'image': 'assets/images/avoid_face.png',
    'bg_color': Color(0xFFB7FFFF),
    'title_color': Color(0xFF00B0FF)
  },
  {
    'title': 'Avoid Close Contact',
    'body':
        'Wash your hands with clean, running water (warm or cold), turn off the tap, and apply soap',
    'image': 'assets/images/social_distancing.png',
    'bg_color': Color(0xFFF9BED2),
    'title_color': Color(0xFFBA2D65)
  },
  {
    'title': 'Stay Clean',
    'body':
        'Wash your hands with clean, running water (warm or cold), turn off the tap, and apply soap',
    'image': 'assets/images/cleaning.png',
    'bg_color': Color(0xFFEFAFFA),
    'title_color': Color(0xFFAA00C7)
  },
];
