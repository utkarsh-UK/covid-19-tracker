import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../widgets/country_stats.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(
    initialPage: 1,
  );

  List<bool> toggleButtonsState = [];

  bool isMyStateSelected = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeData.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 16,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: AssetImage(COVID),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Statistics',
                    style: textTheme.headline3.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        left: isMyStateSelected ? 0 : size.width * 0.45,
                        top: 0,
                        bottom: 0,
                        duration: Duration(milliseconds: 400),
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            width: size.width * 0.4,
                            child: FlatButton(
                              child: FittedBox(
                                child: Text(
                                  'My State',
                                  style: isMyStateSelected
                                      ? textTheme.subtitle1
                                      : textTheme.subtitle1.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onPressed: () {
                                isMyStateSelected = !isMyStateSelected;
                                _pageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInOutSine,
                                );
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.4,
                            child: FlatButton(
                              child: FittedBox(
                                child: Text(
                                  'My Country',
                                  style: isMyStateSelected
                                      ? textTheme.subtitle1.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        )
                                      : textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onPressed: () {
                                isMyStateSelected = !isMyStateSelected;
                                _pageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInOutSine,
                                );
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.0),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(),
                      CountryStats(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
