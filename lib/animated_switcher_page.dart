import 'dart:math';

import 'package:flutter/material.dart';

import 'color_floating_action_button.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _count = 0;
  Color _fabColor = Colors.red;

  void _increment() {
    setState(() {
      var random = Random();
    _fabColor = Colors.accents[random.nextInt(Colors.accents.length - 1)];
    _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Switcher'),
      ),
      body: Center(
          child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        transitionBuilder: (Widget child, Animation<double> animation) {
          // return RotationTransition(child: child, turns: animation,);
          // return FadeTransition(child: child, opacity: animation,);
          return ScaleTransition(child: child, scale: animation,);
        },
        child: Text(
          '$_count',
          key: ValueKey<int>(_count),
          style: Theme.of(context).textTheme.display3,
        ),
      )),
      floatingActionButton: ColorFloatingActionButton(
        onPressed: () {
          _increment();
        },
        duration: Duration(milliseconds: 250),
        backgroundColor: _fabColor,
        child: Icon(Icons.plus_one),
      )
    );
  }
}
