import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../constants/api.dart';
import '../constants/assets.dart';
import '../constants/preventions.dart';

class HelplineScreen extends StatefulWidget {
  @override
  _HelplineScreenState createState() => _HelplineScreenState();
}

class _HelplineScreenState extends State<HelplineScreen> {
  String contactNumber = '';
  String countryFlag = '';
  Map<String, String> contacts = {};

  @override
  void initState() {
    super.initState();

    _emoji();
    getHelplineNumbers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeData.canvasColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xFF3c44c8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10.0,
                        top: 5.0,
                        child: CircleAvatar(
                          radius: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage(COVID),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10.0,
                        top: 5.0,
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        left: 30.0,
                        top: 50.0,
                        child: SizedBox(
                          width: size.width * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Covid-19',
                                style: themeData.textTheme.subtitle2,
                              ),
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(countryFlag),
                                    Text(
                                      'MAH',
                                      style: themeData.textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 30,
                        child: Text(
                          'Are you feeling sick ?',
                          style: themeData.textTheme.button,
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 30,
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: Text(
                            'If you feel sick with any of covid-19 symptoms please call or SMS immediately for help',
                            style: themeData.textTheme.bodyText2,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        left: 5,
                        child: SizedBox(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: 150,
                                child: RaisedButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  padding: const EdgeInsets.all(12.0),
                                  color: Color(0xFFFF0266),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.call, color: Colors.white),
                                      Text(
                                        'Call Now',
                                        style: themeData.textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    if (await launcher
                                        .canLaunch('tel:$contactNumber')) {
                                      launcher.launch('tel:$contactNumber');
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RaisedButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  padding: const EdgeInsets.all(12.0),
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.chat_bubble,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Send SMS',
                                        style: themeData.textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //Can be added url launcher to make SMS
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Preventions',
                  style: textTheme.subtitle2.copyWith(color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: preventions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return preventions[index];
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFaab6fe),
                          Color(0xFF7986cb),
                          Color(0xFF3C44C8),
                        ],
                        stops: [
                          0.1,
                          0.4,
                          0.95,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          child: Image(
                            image: AssetImage(DOCTOR),
                          ),
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Do your own test!\n'),
                                TextSpan(
                                  text:
                                      'Follow the instructions to do your own test.',
                                  style: themeData.textTheme.bodyText2.copyWith(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              ],
                            ),
                            style: themeData.textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _emoji() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "IN";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);

    setState(() => countryFlag = emoji);
  }

  /// Get helpline numbers from [API]
  ///
  /// For demo, only [Maharashtra] state is included
  void getHelplineNumbers() async {
    final response = await http.get(HELPLINE_API);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      contacts.putIfAbsent(
        'MAH',
        () => data['data']['contacts']['regional'][13]['number'],
      );

      contactNumber = data['data']['contacts']['regional'][13]['number'];

      setState(() {});
    }
  }
}
