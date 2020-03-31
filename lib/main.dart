import 'package:flutter/material.dart';

const backgroundColor = Color(0xff5E37DB);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Row(
          children: <Widget>[
            SizedBox(width: 32.0),
            Icon(Icons.arrow_back_ios),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.green.withOpacity(0.2)),
              child: MaterialButton(
                  child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  SizedBox(width: 12.0),
                  Text("Friends",
                      style: TextStyle(fontSize: 18.0, color: Colors.green))
                ],
              )),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          userWidget(),
          pointsWidget(),
          graphWidget(),
          friendsWidget(),
        ],
      ),
    );
  }

  Widget userWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 24.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage('assets/image.jpg'),
              ),
            ),
          ),
          SizedBox(width: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Patricia",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Manzanero",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget pointsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 24.0, right: 16.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: CustomPaint(
          painter: PointsPainter(),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "957",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Place",
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.deepPurpleAccent),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "8500",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "points",
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.deepPurpleAccent),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget graphWidget() {
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
                  Text(
                    "Days",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    "Months",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      "(Visits in days)",
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
                  return Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, top: 24.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          dayItem("01.05", 35, constraints.maxHeight),
                          dayItem("02.05", 25, constraints.maxHeight),
                          dayItem("03.05", 25, constraints.maxHeight),
                          dayItem("04.05", 55, constraints.maxHeight),
                          dayItem("05.05", 35, constraints.maxHeight),
                          dayItem("06.05", 15, constraints.maxHeight),
                          dayItem("07.05", 35, constraints.maxHeight),
                        ],
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
    var barHeight = maxHeight * value / 100.0;
    var offsetY = maxHeight - barHeight - 110.0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: offsetY,
        ),
        Text(value.toString(), style: TextStyle(color: Colors.greenAccent)),
        SizedBox(height: 12.0),
        Container(width: 2.0, height: barHeight, color: Colors.greenAccent),
        SizedBox(height: 12.0),
        Text(day, style: TextStyle(color: Colors.blueGrey))
      ],
    );
  }

  Widget friendsWidget() => Container();
}

class PointsPainter extends CustomPainter {
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = Colors.deepPurpleAccent.withOpacity(0.2);
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width / 2 - 40, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}