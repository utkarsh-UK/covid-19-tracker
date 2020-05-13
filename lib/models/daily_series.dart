import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class DailyAffectedSeries {
  final String time;
  final int count;
  final chart.Color barColor;

  DailyAffectedSeries({
    @required this.time,
    @required this.count,
    @required this.barColor,
  });
}
