import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  void _toogleAnimation() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
          )
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