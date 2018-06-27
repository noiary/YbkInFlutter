import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextInCenter extends StatelessWidget {
  final String _text;

  CommonTextInCenter(this._text);

  @override
  Widget build(BuildContext context) {
    return new Center(child: CommonText(_text));
  }
}

class CommonText extends StatelessWidget {
  final String _text;
  final double size;
  final Color color;

  CommonText(this._text, {this.size: 40.0, this.color: Colors.black87});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        _text,
        style: new TextStyle(fontSize: size, color: this.color),
      ),
    );
  }
}
