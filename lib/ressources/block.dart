import 'package:flutter/material.dart';

class Block extends StatelessWidget
{
  Color _color;
  double? _width;
  double _height;
  Block(this._color, this._width, this._height);
  @override
  Widget build(BuildContext context)
  {
    return Container(height: _height, width: _width, color: _color);
  }
}

class ThreeBlockAlignment extends StatelessWidget
{
  MainAxisAlignment _pos;
  ThreeBlockAlignment(this._pos);
  @override
  Widget build(BuildContext context)
  {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: _pos,
        children: <Widget>[
          Block(Colors.blue, 80, 80),
          Block(Colors.green, 80, 80),
          Block(Colors.red, 80, 80),
        ]
    );
  }
}

class Spaces extends StatelessWidget
{
  double _size;
  Spaces(this._size);
  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: EdgeInsets.all(_size),
    );
  }
}