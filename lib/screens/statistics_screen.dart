import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/api.dart';
import '../constants/assets.dart';
import '../models/daily_series.dart';
import '../models/extensions.dart';
import '../widgets/daily_cases_chart.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with SingleTickerProviderStateMixin {
  Future<List<DailyAffectedSeries>> casesFuture;

  List<bool> toggleButtonsState = [];
  Map<String, int> latestCaseData = {};

  bool isMyStateSelected = false;
  bool isLatestDataFetching = true;

  @override
  void initState() {
    super.initState();

    toggleButtonsState = List.generate(3, (index) => index == 0 ? true : false);
    casesFuture ??= _getDailyCasesData();
    _getLatestCasesData();
  }

  void _getLatestCasesData() async {
    final response = await http.get(LATEST_DATA);
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> responseJSON = json.decode(response.body);
      Map<dynamic, dynamic> officialSummary = responseJSON['data']['summary'];
      List<dynamic> unofficialSummary =
          responseJSON['data']['unofficial-summary'];
      latestCaseData.putIfAbsent('Affected', () => officialSummary['total']);
      latestCaseData.putIfAbsent('Death', () => officialSummary['deaths']);
      latestCaseData.putIfAbsent(
          'Discharged', () => officialSummary['discharged']);
      latestCaseData.putIfAbsent(
          'Recovered', () => unofficialSummary[0]['recovered']);
      latestCaseData.putIfAbsent(
          'Active', () => unofficialSummary[0]['active']);
    }

    setState(() => isLatestDataFetching = false);
  }

  Future<List<DailyAffectedSeries>> _getDailyCasesData() async {
    List<DailyAffectedSeries> cases = [];
    final response = await http.get(HISTORY_DATA);
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> days = data['data'].reversed.toList().sublist(0, 7);

    days.forEach((dayWiseData) {
      String time = '${dayWiseData['day']}';

      List<dynamic> dailyDataList = dayWiseData['regional'];
      var map = dailyDataList
          .firstWhere((regionalData) => regionalData['loc'] == 'Maharashtra');

      cases.add(
        DailyAffectedSeries(
          time: time.substring(5),
          count: map['totalConfirmed'],
          barColor: chart.ColorUtil.fromDartColor(Colors.red),
        ),
      );
    });

    return cases;
  }

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
                                setState(() {
                                  isMyStateSelected = !isMyStateSelected;
                                });
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
                                setState(() {
                                  isMyStateSelected = !isMyStateSelected;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Daily Cases',
                          style: textTheme.bodyText1.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<DailyAffectedSeries>>(
                            future: casesFuture,
                            builder: (ctx, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasData) {
                                return Container(
                                  height: size.height * 0.3,
                                  width: size.width,
                                  child: DailyCasesChart(data: snapshot.data),
                                );
                              } else if (snapshot.error) {
                                return Text('Some error occured');
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
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
                            text: isLatestDataFetching
                                ? 'Fetching...'
                                : '${latestCaseData['Affected']}'
                                    .toFormattedNumber(),
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
                            text: isLatestDataFetching
                                ? 'Fetching...'
                                : '${latestCaseData['Death']}'
                                    .toFormattedNumber(),
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
                            text: isLatestDataFetching
                                ? 'Fetching...'
                                : '${latestCaseData['Recovered']}'
                                    .toFormattedNumber(),
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
                            text: isLatestDataFetching
                                ? 'Fetching...'
                                : '${latestCaseData['Active']}'
                                    .toFormattedNumber(),
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
                            text: isLatestDataFetching
                                ? 'Fetching...'
                                : '${latestCaseData['Discharged']}'
                                    .toFormattedNumber(),
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
