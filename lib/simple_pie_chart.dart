import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimplePieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const SimplePieChart({
    Key? key,
    required this.seriesList,
    required this.animate,
  }) : super(key: key);

  factory SimplePieChart.withSampleData() {
    return SimplePieChart(
      seriesList: _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding here
      child: AspectRatio(
        aspectRatio: 1, // Set aspect ratio to 1 for a circular pie chart
        child: Container(
          color: const Color.fromARGB(255, 194, 193, 193), // Set background color
          child: charts.PieChart(
            seriesList,
            animate: animate,
            defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 60, // Set the width of the arcs
              arcRendererDecorators: [
                charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.auto,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, String>> _createSampleData() {
    final data = [
      TimeSeriesSales('A', 100),
      TimeSeriesSales('B', 200),
      TimeSeriesSales('C', 300),
      TimeSeriesSales('D', 150),
    ];

    return [
      charts.Series<TimeSeriesSales, String>(
        id: 'Sales',
        domainFn: (TimeSeriesSales sales, _) => sales.category,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (TimeSeriesSales row, _) => '${row.category}: ${row.sales}', // Display labels with category and value
      )
    ];
  }
}

class TimeSeriesSales {
  final String category;
  final int sales;

  TimeSeriesSales(this.category, this.sales);
}
