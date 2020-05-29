import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/preventions.dart';

class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Precautions for COVID-19',
              style: textTheme.subtitle1.copyWith(fontSize: 18.0),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: precautions
                    .map(
                      (step) => Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        decoration: BoxDecoration(
                          color: step['bg_color'],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          isThreeLine: true,
                          leading: Container(
                            width: 60,
                            height: 200,
                            child: Image.asset(
                              step['image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: SizedBox(
                            width: 60,
                            child: Text(
                              step['title'],
                              style: GoogleFonts.quicksand(
                                fontSize: 18.0,
                                color: step['title_color'],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            step['body'],
                            style: textTheme.caption
                                .copyWith(color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
