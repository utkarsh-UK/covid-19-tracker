import 'package:about/about.dart';
import 'package:covid/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/assets.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutPage(
        applicationLegalese: 'Copyright © Utkarsh Kore, 2020',
        applicationDescription: Text(
          'Track daily COVID-19 status build specifically for Maharashtra State',
          style: GoogleFonts.quicksand(
            color: MyColors.PRIMARY_COLOR,
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        children: <Widget>[
          ListTile(
            leading: Icon(FontAwesome.github),
            title: Text(
              'Github',
            ),
          ),
          ListTile(
            leading: Icon(FontAwesome.instagram),
            title: Text(
              'Instagram',
            ),
          ),
        ],
        applicationIcon: const SizedBox(
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage(COVID),
          ),
        ),
      ),
    );
  }
}
