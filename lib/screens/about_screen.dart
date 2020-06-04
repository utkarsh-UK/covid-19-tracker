import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launch;

import '../constants/assets.dart';
import '../constants/colors.dart';

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
            onTap: () async {
              String url = 'https://github.com/utkarsh-UK';
              if (await launch.canLaunch(url)) {
                launch.launch(url);
              }
            },
          ),
          ListTile(
            leading: Icon(FontAwesome.instagram),
            title: Text(
              'Instagram',
            ),
            onTap: () async {
              String url = 'https://www.instagram.com/_utkarsh_kore_uk/';
              if (await launch.canLaunch(url)) {
                launch.launch(url);
              }
            },
          ),
          ListTile(
            leading: Icon(FontAwesome.linkedin),
            title: Text(
              'Linked In',
            ),
            onTap: () async {
              String url = 'https://www.linkedin.com/in/utkarsh-kore-175080174';
              if (await launch.canLaunch(url)) {
                launch.launch(url);
              }
            },
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
