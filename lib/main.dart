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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicitly Animation'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _listItem(context, 'Animated Opacity', AnimatedOpacityPage()),
            _listItem(context, 'Animated Align', AnimatedAlignPage()),
            _listItem(context, 'Animated Theme and Default Text Style',
                AnimatedStylePage()),
            _listItem(context, 'Animated Switcher', AnimatedSwitcherPage()),
            _listItem(context, 'Matrix Page', MatrixPage())
          ],
        ),
      ),
    );
  }

  _listItem(BuildContext context, String title, Widget nextPage) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
    );
  }
}
