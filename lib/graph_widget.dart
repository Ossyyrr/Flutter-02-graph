import 'package:flutter/material.dart';
import 'package:fluttergraphdaysmonths/day_item.dart';

enum PeriodSelection { Days, Months }

class GraphWidget extends StatefulWidget {
  List<int> dayValues = [55, 58, 45, 25, 35, 15, 12];
  List<int> monthValues = [50, 35, 22, 14, 52, 41];
  List<String> dayLabels = [
    '01/05',
    '02/05',
    '03/05',
    '04/05',
    '05/05',
    '06/05',
    '07/05'
  ];
  List<String> monthLabels = ['01', '02', '03', '04', '05', '06'];

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  PeriodSelection periodSelected = PeriodSelection.Days;

  @override
  Widget build(BuildContext context) {
    List<int> values;
    List<String> labels;
    if (periodSelected == PeriodSelection.Days) {
      values = widget.dayValues;
      labels = widget.dayLabels;
    } else {
      values = widget.monthValues;
      labels = widget.monthLabels;
    }

    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, top: 24.0, right: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        periodSelected = PeriodSelection.Days;
                      });
                    },
                    child: Text(
                      "Days",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: periodSelected == PeriodSelection.Days
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        periodSelected = PeriodSelection.Months;
                      });
                    },
                    child: Text(
                      "Months",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: periodSelected == PeriodSelection.Months
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "(Visits)",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  List<Widget> rows = [];

                  values.asMap().forEach((index, value) {
                    var label = labels[index];
                    rows.add(dayItem(label, value, constraints.maxHeight));
                  });

                  return Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, top: 24.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: rows,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dayItem(String day, int value, double maxHeight) {
    return DayItem(
      day: day,
      value: value,
      maxHeight: maxHeight,
    );
  }
}
