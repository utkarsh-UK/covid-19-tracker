import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';

import '../models/daily_series.dart';
import '../models/extensions.dart';

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
        labelAccessorFn: (DailyAffectedSeries series, _) =>
            '${series.count}'.toFormattedNumber(),
        insideLabelStyleAccessorFn: (DailyAffectedSeries series, _) =>
            chart.TextStyleSpec(
                color: chart.MaterialPalette.white, fontWeight: 'bold'),
        outsideLabelStyleAccessorFn: (DailyAffectedSeries series, _) =>
            chart.TextStyleSpec(
          color: chart.MaterialPalette.white,
          fontWeight: 'w700',
        ),
      ),
    ];

    return chart.BarChart(
      series,
      animate: true,
      barGroupingType: chart.BarGroupingType.groupedStacked,
      barRendererDecorator: chart.BarLabelDecorator<String>(
        labelPosition: chart.BarLabelPosition.inside,
        outsideLabelStyleSpec: chart.TextStyleSpec(
          fontSize: 10,
          fontWeight: 'bold',
        ),
      ),
      animationDuration: Duration(seconds: 1),
      defaultInteractions: true,
    );
  }
}
