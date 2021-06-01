import 'package:flutter/material.dart';
import 'dart:async';
import 'ressources/navbar.dart';
import 'class/HorlogeState.dart';

class HorlogeTexte extends StatefulWidget {
  HorlogeTexte({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _HorlogeTexte createState() => _HorlogeTexte();
}

class _HorlogeTexte extends State<HorlogeTexte>
{

  HorlogeState horloge = new HorlogeState();

  @override
  void initState()
  {
    Timer.periodic(Duration(microseconds: 100), (timer) {
      setState(() {
        horloge.Update();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Horloge Text')
        ),
        drawer: MyDrawer(),

        body: Center(
          child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 5),borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child : Text("${horloge.hours} : ${horloge.minutes} : ${horloge.secondes}",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center)
          )
        )
    );
  }
}