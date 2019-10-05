import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  MatrixPage({Key key}) : super(key: key);

  @override
  _MatrixPageState createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  bool _isPlaying = false;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Offset _offset = Offset.zero;

  void _changeValues() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      if (_isPlaying) {
        setState(() {
          final random = Random();

          _width = max(50, random.nextInt(300).toDouble());
          _height = max(50, random.nextInt(300).toDouble());

          _color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );

          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _animatedWidget(context),
        ));
  }

  _animatedWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeValues,
        child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
