import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _StockData {
  _StockData(this.date, this.stockClose);

  final String date;
  final double stockClose;
}

List<_StockData> dowData = [
  _StockData('2022-01-18', 35368.47),
  _StockData('2022-01-19', 35028.65),
  _StockData('2022-01-20', 34715.39),
  _StockData('2022-01-21', 34265.37),
  _StockData('2022-01-24', 34364.50),
  _StockData('2022-01-25', 34297.73),
  _StockData('2022-01-26', 34168.09),
  _StockData('2022-01-27', 34160.78),
  _StockData('2022-01-28', 34725.47),
  _StockData('2022-01-31', 35131.86),
  _StockData('2022-02-01', 35405.24),
  _StockData('2022-02-02', 35629.33),
  _StockData('2022-02-03', 35111.16),
  _StockData('2022-02-04', 35089.74),
  _StockData('2022-02-07', 35091.13),
  _StockData('2022-02-08', 35462.78),
  _StockData('2022-02-09', 35768.06),
  _StockData('2022-02-10', 35241.59),
  _StockData('2022-02-11', 34738.06),
  _StockData('2022-02-14', 34566.17),
  _StockData('2022-02-15', 34988.84),
  _StockData('2022-02-16', 34713.79),
];
List<_StockData> sp500Data = [
  _StockData('2022-01-18', 4577.11),
  _StockData('2022-01-19', 4532.76),
  _StockData('2022-01-20', 4482.73),
  _StockData('2022-01-21', 4397.94),
  _StockData('2022-01-24', 4410.13),
  _StockData('2022-01-25', 4356.45),
  _StockData('2022-01-26', 4349.93),
  _StockData('2022-01-27', 4326.51),
  _StockData('2022-01-28', 4431.85),
  _StockData('2022-01-31', 4515.55),
  _StockData('2022-02-01', 4546.54),
  _StockData('2022-02-02', 4589.38),
  _StockData('2022-02-03', 4477.44),
  _StockData('2022-02-04', 4500.53),
  _StockData('2022-02-07', 4483.87),
  _StockData('2022-02-08', 4521.54),
  _StockData('2022-02-09', 4587.18),
  _StockData('2022-02-10', 4504.08),
  _StockData('2022-02-11', 4418.64),
  _StockData('2022-02-14', 4401.67),
  _StockData('2022-02-15', 4471.07),
  _StockData('2022-02-16', 4475.01),
];

List<_StockData> nasdaq100Data = [
  _StockData('2022-01-18', 14506.90),
  _StockData('2022-01-19', 14340.26),
  _StockData('2022-01-20', 14154.02),
  _StockData('2022-01-21', 13768.92),
  _StockData('2022-01-24', 13855.13),
  _StockData('2022-01-25', 13539.30),
  _StockData('2022-01-26', 13542.12),
  _StockData('2022-01-27', 13352.78),
  _StockData('2022-01-28', 13770.57),
  _StockData('2022-01-31', 14239.88),
  _StockData('2022-02-01', 14346.00),
  _StockData('2022-02-02', 14417.55),
  _StockData('2022-02-03', 13878.82),
  _StockData('2022-02-04', 14098.01),
  _StockData('2022-02-07', 14015.67),
  _StockData('2022-02-08', 14194.46),
  _StockData('2022-02-09', 14490.37),
  _StockData('2022-02-10', 14185.64),
  _StockData('2022-02-11', 13791.15),
  _StockData('2022-02-14', 13790.92),
  _StockData('2022-02-15', 14139.76),
  _StockData('2022-02-16', 14124.10),
];

List<List<_StockData>> getChartDataList(
    {required isNasdaqGraphVisible, required isSP500GraphVisible, required isDowGraphVisible}) {
  const numberOfBoxes = 3; // number of boxes on the chart
  // TODO: Refactor
  var selectedValues = <List<double>>[];
  var dates = <String>[];

  try {
    final firstGraphMinUSA = dowData.reduce((current, next) => current.stockClose < next.stockClose ? current : next);
    final firstGraphMaxUSA = dowData.reduce((current, next) => current.stockClose > next.stockClose ? current : next);
    final secondGraphMinUSA =
        sp500Data.reduce((current, next) => current.stockClose < next.stockClose ? current : next);
    final secondGraphMaxUSA =
        sp500Data.reduce((current, next) => current.stockClose > next.stockClose ? current : next);
    final thirdGraphMinUSA =
        nasdaq100Data.reduce((current, next) => current.stockClose < next.stockClose ? current : next);
    final thirdGraphMaxUSA =
        nasdaq100Data.reduce((current, next) => current.stockClose > next.stockClose ? current : next);

    selectedValues = [
      if (isNasdaqGraphVisible)
        nasdaq100Data.map<double>(
          (e) {
            dates.add(e.date);
            return (e.stockClose.toDouble() - thirdGraphMinUSA.stockClose.toDouble()) /
                (thirdGraphMaxUSA.stockClose.toDouble() - thirdGraphMinUSA.stockClose.toDouble());
          },
        ).toList(),
      if (isSP500GraphVisible)
        sp500Data
            .map<double>((e) =>
                (e.stockClose.toDouble() - secondGraphMinUSA.stockClose.toDouble()) /
                (secondGraphMaxUSA.stockClose.toDouble() - secondGraphMinUSA.stockClose.toDouble()))
            .toList(),
      if (isDowGraphVisible)
        dowData
            .map<double>((e) =>
                (e.stockClose.toDouble() - firstGraphMinUSA.stockClose.toDouble()) /
                (firstGraphMaxUSA.stockClose.toDouble() - firstGraphMinUSA.stockClose.toDouble()))
            .toList(),
    ];

    final firstLineValuesUSALength = dowData.length;
    final secondLineValuesUSALength = sp500Data.length;
    final thirdLineValuesUSALength = nasdaq100Data.length;

    final listDifferences = [
      firstLineValuesUSALength,
      secondLineValuesUSALength,
      thirdLineValuesUSALength,
    ];
    final largestValue = listDifferences.reduce((current, next) => current > next ? current : next);

    if (firstLineValuesUSALength < largestValue) {
      final difference = largestValue - firstLineValuesUSALength;

      for (var i = 0; i < difference; i++) {
        dowData.add(dowData.last);
      }
    }
    if (secondLineValuesUSALength < largestValue) {
      final difference = largestValue - secondLineValuesUSALength;

      for (var i = 0; i < difference; i++) {
        sp500Data.add(sp500Data.last);
      }
    }
    if (thirdLineValuesUSALength < largestValue) {
      final difference = largestValue - thirdLineValuesUSALength;
      for (var i = 0; i < difference; i++) {
        nasdaq100Data.add(nasdaq100Data.last);
      }
    }

    var min = 0.0;
    var max = 0.0;

    for (var i = 0; i < selectedValues.length; i++) {
      final arr = selectedValues[i];
      for (var x = 0; x < arr.length; x++) {
        if (arr[x] < min) {
          min = arr[x];
        } else if (arr[x] > max) {
          max = arr[x];
        }
      }
    }

    min *= -1;
    print('MIN IS ' + min.toString());
    max += min;

    var temp = selectedValues
        .map(
          (list) => list.map(
            (e) {
              final value = e + min;
              return value / max * 10 * numberOfBoxes;
            },
          ).toList(),
        )
        .toList();

    var resultTemp = <List<_StockData>>[];
    for (var graph in temp) {
      var firstGraph = <_StockData>[];
      for (int i = 0; i < graph.length; i++) {
        firstGraph.add(_StockData(dates[i], graph[i]));
      }
      resultTemp.add(firstGraph);
    }
    return resultTemp;
  } catch (e) {
    return [];
  }
}

class MarketsPage extends StatefulWidget {
  const MarketsPage({Key? key}) : super(key: key);

  @override
  State<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  late bool isDowGraphVisible;
  late bool isSP500GraphVisible;
  late bool isNasdaqGraphVisible;
  late List<List<_StockData>> allGraphValues;

  @override
  void initState() {
    super.initState();
    isDowGraphVisible = true;
    isSP500GraphVisible = true;
    isNasdaqGraphVisible = true;
    allGraphValues = getChartDataList(
      isNasdaqGraphVisible: isNasdaqGraphVisible,
      isSP500GraphVisible: isSP500GraphVisible,
      isDowGraphVisible: isDowGraphVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Markets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              //enableAxisAnimation: true,
              zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
              //Define properties to the axis
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.MMMd(),
                intervalType: DateTimeIntervalType.days,
                interval: 7,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                //maximum: DateTime(2022, 2, 16),
                //minimum: DateTime(2022, 1, 17),
                //maximumLabels: 2,
              ),
              primaryYAxis: NumericAxis(
                //interval: 1280,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                labelStyle: const TextStyle(fontSize: 0),
                minimum: -10,
                maximum: 40,
              ),
              // Enable tooltip
              //tooltipBehavior: TooltipBehavior(enable: true),
              //Put all the graphs in the chart
              series: <ChartSeries<_StockData, DateTime>>[
                if (isDowGraphVisible)
                  LineSeries<_StockData, DateTime>(
                    dataSource: allGraphValues[0],
                    xValueMapper: (_StockData stocks, _) => DateTime.parse(stocks.date),
                    yValueMapper: (_StockData stocks, _) => stocks.stockClose,
                    color: Colors.pink[300],
                    width: 3.5,
                    name: 'Dow Jones',
                    isVisible: isDowGraphVisible,
                  ),
                if (isSP500GraphVisible)
                  LineSeries<_StockData, DateTime>(
                    dataSource: allGraphValues[1],
                    xValueMapper: (_StockData stocks, _) => DateTime.parse(stocks.date),
                    yValueMapper: (_StockData stocks, _) => stocks.stockClose,
                    color: Colors.yellow,
                    width: 3.5,
                    name: 'Dow Jones',
                    isVisible: isSP500GraphVisible,
                  ),
                if (isNasdaqGraphVisible)
                  LineSeries<_StockData, DateTime>(
                    dataSource: allGraphValues[2],
                    xValueMapper: (_StockData stocks, _) => DateTime.parse(stocks.date),
                    yValueMapper: (_StockData stocks, _) => stocks.stockClose,
                    color: Colors.purple,
                    width: 3.5,
                    name: 'Dow Jones',
                    isVisible: isNasdaqGraphVisible,
                  ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink[300]),
                  onPressed: () {
                    setState(
                      () {
                        //Don't allow hiding the graph if it is the only one visible
                        if (isDowGraphVisible && (isSP500GraphVisible || isNasdaqGraphVisible)) {
                          isDowGraphVisible = false;
                        } else {
                          isDowGraphVisible = true;
                        }
                      },
                    );
                  },
                  child: const Text("Dow Jones"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  onPressed: () {
                    setState(
                      () {
                        //Don't allow hiding the graph if it is the only one visible
                        if (isSP500GraphVisible && (isDowGraphVisible || isNasdaqGraphVisible)) {
                          isSP500GraphVisible = false;
                        } else {
                          isSP500GraphVisible = true;
                        }
                      },
                    );
                  },
                  child: const Text("S&P 500"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  onPressed: () {
                    setState(
                      () {
                        //Don't allow hiding the graph if it is the only one visible
                        if (isNasdaqGraphVisible && (isDowGraphVisible || isSP500GraphVisible)) {
                          isNasdaqGraphVisible = false;
                        } else {
                          isNasdaqGraphVisible = true;
                        }
                      },
                    );
                  },
                  child: const Text("Nasdaq 100"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
