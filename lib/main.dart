

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  Color color = Colors.orange;
  static const double maxWidth = 200;
  static const double minWidth = 60;

  double width = maxWidth;
  double height = maxWidth;

  BorderRadius borderRadius = BorderRadius.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: width,
              height: height,

              decoration: BoxDecoration(
                  color: color,
                borderRadius: borderRadius
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              final random = Random();

              // animating color
              final red = random.nextInt(155);
              final green = random.nextInt(155);
              final blue = random.nextInt(155);

              final color = Color.fromRGBO(red, green, blue, 1);

              // animating size
              final max = maxWidth.toInt() - minWidth.toInt();
              final width = minWidth + random.nextInt(max);
              final height = minWidth + random.nextInt(max);

              // animating borderRadius
              final borderRadius = BorderRadius.circular(random.nextDouble() * 50);

              setState(() {
                this.borderRadius = borderRadius;
                this.width = width;
                this.height = height;
                this.color = color;
              });

            }, child: Text("Play with Container"))
          ],
        ),
      ),
    );
  }
}

