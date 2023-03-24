import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[600],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Center(
              child:Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Ask Me Anything',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Ubuntu',
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.green[900]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Ask Me Anything',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Ubuntu',
                      color: Colors.white,
                    ),
                  ),
                ],
              )
          ),
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    randomize();
                  });
                  print('Ball Number: ${ballNumber + 1}');
                },
                child: Image.asset('images/ball${ballNumber + 1}.png')),
          ),
        ),
      ]),
    );
  }

  void randomize() {
    ballNumber = Random().nextInt(5);
  }
}
