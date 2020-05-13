import 'package:flutter/material.dart';
import '../models/daily_series.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class DailyCasesChart extends StatelessWidget {
  final List<DailyAffectedSeries> data;

  DailyCasesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<chart.Series<DailyAffectedSeries, String>> series = [
      chart.Series(
        id: 'Daily Cases',
        data: data,
        domainFn: (DailyAffectedSeries series, _) => series.time,
        measureFn: (DailyAffectedSeries series, int index) => series.count,
        colorFn: (DailyAffectedSeries series, int index) => series.barColor,
        displayName: 'Affected',
      ),
    ];

    return chart.BarChart(
      series,
      animate: true,
      barGroupingType: chart.BarGroupingType.groupedStacked,
    );
  }
}
