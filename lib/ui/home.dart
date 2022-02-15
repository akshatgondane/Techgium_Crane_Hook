import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:crane_hook/firebase/flutterfire.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Crane Hook"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(child: Container(
              alignment: Alignment.center,
              child: Transform.rotate(
                  angle: math.pi/8,
                  child: CustomPaint(size: Size(275, 275), painter: Arcs(),
                  )),
            ),),
            Positioned(child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 165, right: 100, top: 240),
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ))






          ],

    ))
    );
  }
}

class Rectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(99, 75) & Size(75, 125), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class Arcs extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) 
  {

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi/4,
      tileMode: TileMode.repeated,
      colors: [Colors.grey, Colors.black12],
    );


    final double diameter = size.width;
    final arcsRect = Rect.fromLTWH(0, 0, diameter, diameter);
    final useCenter = true;

    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(arcsRect);
    
    canvas.drawArc(arcsRect, (5 * math.pi)/4, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, (3 * math.pi)/2, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, (7 * math.pi)/4, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, 0, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, math.pi/4, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, math.pi/2, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, (3 * math.pi)/4, math.pi/4, useCenter, paint);
    canvas.drawArc(arcsRect, math.pi, math.pi/4, useCenter, paint);


  }

  @override
  bool shouldRepaint(CustomPainter old)
  {
    return false;
  }
  
}
