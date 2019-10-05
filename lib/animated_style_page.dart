import 'package:flutter/material.dart';

class AnimatedStylePage extends StatefulWidget {
  @override
  _AnimatedStylePageState createState() =>_AnimatedStylePageState();
}

class _AnimatedStylePageState
    extends State<AnimatedStylePage> {
  TextStyle _firstStyle = TextStyle(fontSize: 16, color: Colors.blue);
  TextStyle _secondStyle = TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.italic,
      color: Colors.red,
      fontWeight: FontWeight.w600,
      letterSpacing: 2.5,
      wordSpacing: 4,
      shadows: [
        Shadow(
          blurRadius: 10.0,
          color: Colors.purple[200],
          offset: Offset(5.0, 5.0),
        ),
      ]);
  TextStyle _style = TextStyle(fontSize: 16, color: Colors.blue);

  ThemeData _firstTheme = ThemeData.light();
  ThemeData _secondTheme = ThemeData.dark();

  ThemeData _theme = ThemeData.light();

  void _toogleAnimation() {
    setState(() {
      _style = _style == _firstStyle ? _secondStyle : _firstStyle;
      _theme = _theme == _firstTheme ? _secondTheme : _firstTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _theme,
      duration: Duration(milliseconds: 450),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animated Theme and Default Text Style'),
        ),
        body: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 600),
          style: _style,
          child: Text(
              'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            _toogleAnimation();
          },
        ),
      ),
    );
  }
}
