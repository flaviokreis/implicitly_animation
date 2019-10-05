import 'package:flutter/material.dart';

class ColorFloatingActionButton extends ImplicitlyAnimatedWidget {
  final Color backgroundColor;
  final Function onPressed;
  final Widget child;

  ColorFloatingActionButton(
      {Key key,
      @required this.onPressed,
      @required this.backgroundColor,
      @required Duration duration,
      this.child})
      : super(duration: duration, curve: Curves.easeInOut, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _ColorFloatingActionButtonState();
}

class _ColorFloatingActionButtonState extends AnimatedWidgetBaseState<ColorFloatingActionButton> {
  ColorTween _colorTween;

  @override
  void forEachTween(TweenVisitor visitor) {
    _colorTween = visitor(_colorTween, widget.backgroundColor,
        (dynamic value) => ColorTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: _colorTween.evaluate(animation),
      child: widget.child,
    );
  }
}
