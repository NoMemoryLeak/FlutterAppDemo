import 'package:flutter/material.dart';
import 'ressources/navbar.dart';
import 'ressources/block.dart';

class Positions extends StatefulWidget {
  Positions({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _Positions createState() => _Positions();
}

class _Positions extends State<Positions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Example of Positions')
      ),
      drawer: MyDrawer(),

      body: Column(
        children: <Widget>[
          Spaces(8),
          Text('Start'),
          ThreeBlockAlignment(MainAxisAlignment.start),
          Spaces(8),
          Text('End'),
          ThreeBlockAlignment(MainAxisAlignment.end),
          Spaces(8),
          Text('SpaceBetween'),
          ThreeBlockAlignment(MainAxisAlignment.spaceBetween),
          Spaces(8),
          Text('SpaceAround'),
          ThreeBlockAlignment(MainAxisAlignment.spaceAround),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}