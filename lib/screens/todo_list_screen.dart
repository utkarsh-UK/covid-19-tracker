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

/* class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint paint = Paint();

    // Draw main background rectangle
    Path mainPath = Path();
    mainPath.addRect(Rect.fromLTWH(0.0, 0.0, width, height));
    paint.color = MyColors.mainBackgroundColor;
    canvas.drawPath(mainPath, paint);

    //Draw red path besides purple path
    Path redPath = Path();
    redPath.moveTo(width * 0.9, 0.0);
    redPath.quadraticBezierTo(width * 0.5, height * 0.2, 0, height * 0.85);
    redPath.lineTo(0, height);
    redPath.lineTo(width * 0.3, height);
    redPath.quadraticBezierTo(width * 0.4, height * 0.75, width, height * 0.5);
    redPath.lineTo(width, 0);
    redPath.close();
    paint.color = MyColors.redColor;
    canvas.drawPath(redPath, paint);

    //Draw purple path besides triangle path
    Path purplePath = Path();
    purplePath.lineTo(width * 0.4, 0);
    purplePath.quadraticBezierTo(width * 0.25, height * 0.27, 0, height * 0.5);
    purplePath.close();
    paint.color = MyColors.purpleColor;
    canvas.drawPath(purplePath, paint);

    //Draw orange path over background
    Path orangePath = Path();
    orangePath.lineTo(0.0, height * 0.8);
    orangePath.quadraticBezierTo(
        width * 0.25, height * 0.85, width * 0.4, height);
    orangePath.lineTo(0, height);
    orangePath.close();
    paint.color = MyColors.orangeColor;
    canvas.drawPath(orangePath, paint);

    //Draw triangle path
    Path triPath = Path();
    triPath.lineTo(width * 0.3, 0.0);
    triPath.lineTo(0.0, height * 0.25);
    triPath.close();
    paint.color = MyColors.cyanColor;
    canvas.drawPath(triPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
} */
