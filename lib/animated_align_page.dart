import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  AlignmentGeometry _alignment = Alignment.topLeft;

  void _toogleAnimation() {
    setState(() {
      _alignment = _alignment == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Align'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue[100],
          child: AnimatedAlign(
            alignment: _alignment,
            duration: Duration(milliseconds: 600),
            child: FlutterLogo(
              size: 75,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _toogleAnimation();
        },
      ),
    );
  }
}
