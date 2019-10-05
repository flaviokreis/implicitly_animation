import 'package:flutter/material.dart';
import 'matrix_page.dart';
import 'animated_opacity_page.dart';
import 'animated_style_page.dart';
import 'animated_switcher_page.dart';
import 'animated_align_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      home: AnimatedOpacityPage(),
      // home: AnimatedAlignPage(),
      // home: AnimatedSwitcherPage(),
      // home: AnimatedStylePage(),
      // home: MatrixPage(),
    );
  }
}

