import 'dart:convert';

import 'package:covid/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import '../models/daily_series.dart';
import '../widgets/daily_cases_chart.dart';
import 'package:http/http.dart' as http;
import '../constants/api.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool isMyStateSelected = true;
  List<bool> toggleButtonsState = [];
  List<DailyAffectedSeries> cases = [];

  @override
  void initState() {
    super.initState();

    toggleButtonsState = List.generate(3, (index) => index == 0 ? true : false);
    /* http.get(HISTORY_DATA).then((response) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> days = data['data'];
      print(days.reversed.toList().sublist(0, 7)[0]['regional'][4]
          ['totalConfirmed']);
    }); */
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final List<DailyAffectedSeries> data = [
      DailyAffectedSeries(
        time: '11',
        count: 1000,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '12',
        count: 2000,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '13',
        count: 3000,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '14',
        count: 4000,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '15',
        count: 1500,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '16',
        count: 2500,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
      DailyAffectedSeries(
        time: '17',
        count: 500,
        barColor: chart.ColorUtil.fromDartColor(Colors.red),
      ),
    ];

    return Scaffold(
      backgroundColor: themeData.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                    width: size.width * 0.9,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: FlatButton(
                            color: isMyStateSelected
                                ? Colors.white
                                : Colors.transparent,
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
                              setState(() {
                                isMyStateSelected = !isMyStateSelected;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: FlatButton(
                            color: isMyStateSelected
                                ? Colors.transparent
                                : Colors.white,
                            child: FittedBox(
                              child: Text(
                                'My Country',
                                style: isMyStateSelected
                                    ? textTheme.subtitle1.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                    : textTheme.subtitle1,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onPressed: () {
                              setState(() {
                                isMyStateSelected = !isMyStateSelected;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ToggleButtons(
                      selectedColor: Colors.white,
                      isSelected: toggleButtonsState,
                      disabledColor: Colors.white.withOpacity(0.9),
                      fillColor: Colors.transparent,
                      onPressed: (int index) {
                        setState(() {
                          toggleButtonsState[index] =
                              !toggleButtonsState[index];
                        });
                      },
                      children: [
                        Text('Total', style: textTheme.caption),
                        Text('Today', style: textTheme.caption),
                        Text('Yesterday', style: textTheme.caption),
                      ],
                    ),
                  ),
                  _buildTotalDatasetWidget(size: size, textTheme: textTheme),
                  SizedBox(height: 12.0),
                  Expanded(
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Daily Cases',
                            style: textTheme.bodyText1.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: size.height * 0.3,
                            width: size.width,
                            child: DailyCasesChart(data: data),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalDatasetWidget({
    Size size,
    TextTheme textTheme,
  }) {
    return Container(
      width: size.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.13,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFc6a700),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Affected\n'),
                          TextSpan(
                            text: '3,36,456',
                            style: textTheme.button.copyWith(fontSize: 28.0),
                          ),
                        ],
                      ),
                      style: textTheme.caption
                          .copyWith(fontSize: 20.0, height: 1.5),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.13,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFff5722),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Death\n'),
                          TextSpan(
                            text: '92,678',
                            style: textTheme.button.copyWith(fontSize: 28.0),
                          ),
                        ],
                      ),
                      style: textTheme.caption
                          .copyWith(fontSize: 20.0, height: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  width: size.width * 0.25,
                  height: size.height * 0.1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF00bfa5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Recovered\n'),
                          TextSpan(
                            text: '1,23,456',
                            style: textTheme.button.copyWith(fontSize: 20.0),
                          ),
                        ],
                      ),
                      style: textTheme.caption
                          .copyWith(fontSize: 16.0, height: 1.5),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: size.width * 0.25,
                  height: size.height * 0.1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF26c6da),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Active\n'),
                          TextSpan(
                            text: '7,45,890',
                            style: textTheme.button.copyWith(fontSize: 20.0),
                          ),
                        ],
                      ),
                      style: textTheme.caption
                          .copyWith(fontSize: 16.0, height: 1.5),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: size.width * 0.25,
                  height: size.height * 0.1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFaa00ff),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Discharged\n'),
                          TextSpan(
                            text: '92,678',
                            style: textTheme.button.copyWith(fontSize: 20.0),
                          ),
                        ],
                      ),
                      style: textTheme.caption
                          .copyWith(fontSize: 16.0, height: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
