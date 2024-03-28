import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;

  const SimpleTimeSeriesChart({
    Key? key,
    required this.seriesList,
    required this.animate,
  }) : super(key: key);

  factory SimpleTimeSeriesChart.withSampleData() {
    return SimpleTimeSeriesChart(
      seriesList: _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding here
      child: AspectRatio(
        aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
        child: Container(
          color: const Color.fromARGB(255, 194, 193, 193), // Set background color to white
          child: charts.TimeSeriesChart(
            seriesList,
            animate: animate,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2023, 8, 15), 300),
      TimeSeriesSales(DateTime(2023, 9, 15), 250),
      TimeSeriesSales(DateTime(2023, 10, 15), 100),
      TimeSeriesSales(DateTime(2023, 11, 15), 170),
      TimeSeriesSales(DateTime(2023, 12, 15), 400),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
