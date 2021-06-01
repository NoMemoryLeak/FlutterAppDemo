import 'package:flutter/material.dart';
import 'dart:async';

class HorlogeState
{
  int? _heures , _minutes, _secondes;
  DateTime? _date;
  Color? _first;
  Color? _second;

  HorlogeState()
  {
    _date = DateTime.now();
    _heures = _date?.hour; //les heures, entre 0 et 23
    _minutes = _date?.minute; //les minutes, entre 0 et 59
    _secondes = _date?.second;
    _first = Colors.white;
    _second = Colors.black;
  }

  void Update()
  {
    _date = DateTime.now();
    _heures = _date?.hour; //les heures, entre 0 et 23
    _minutes = _date?.minute; //les minutes, entre 0 et 59
    _secondes = _date?.second;
  }

  void UpdateColor(Color one,Color two)
  {
    _first = one;
    _second = two;
  }

  int? get hours{
    return _heures;
  }

  int? get minutes{
    return _minutes;
  }

  int? get secondes{
    return _secondes;
  }

  Color? get first{
    return _first;
  }

  Color? get second{
    return _second;
  }
}
