import 'package:flutter/material.dart';
import 'ressources/navbar.dart';
import 'class/HorlogeState.dart';
import 'ressources/block.dart';
import 'dart:async';
import 'dart:math' as math;


class HorlogeDarkMode extends StatefulWidget {
  HorlogeDarkMode({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _HorlogeDarkMode createState() => _HorlogeDarkMode();
}

class _HorlogeDarkMode extends State<HorlogeDarkMode> {
  String mode = 'light';
  String oppositemode = 'dark';
  HorlogeState horloge = new HorlogeState();

  @override
  void initState()
  {
    Timer.periodic(Duration(microseconds: 500), (timer) {
      setState(() {
        horloge.Update();
      });
    });
  }

  void ChangeMode()
  {
    setState(() {
      if(this.mode =='dark')
      {
        this.mode = "light";
        this.oppositemode = "dark";
        horloge.UpdateColor(Colors.white, Colors.black);
      }
      else {
        this.mode = "dark";
        this.oppositemode = "light";
        horloge.UpdateColor(Colors.black, Colors.white);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Horloge')
      ),
      drawer: MyDrawer(),

      body: Container(
        color: horloge.first,
        child : Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: const Alignment(0, 0),
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/10 ,
                        image: AssetImage("assets/images/"+this.mode+"/cadran.png"),
                        fit: BoxFit.contain,
                      ),
                      Transform.rotate(
                        angle: (-6*(horloge.secondes)! * (math.pi / 180) * -1),
                        child: Image(
                          width: 10 ,
                          image: AssetImage("assets/images/"+this.mode+"/aiguille3.png"),
                          fit: BoxFit.contain,
                        ),),
                      Transform.rotate(
                        angle: (-6*(horloge.minutes)! * (math.pi / 180) * -1),
                        child: Image(
                          width: 9 ,
                          image: AssetImage("assets/images/"+this.mode+"/aiguille1.png"),
                          fit: BoxFit.contain,
                        ),),
                      Transform.rotate(
                        angle: (-30*(horloge.hours)! * (math.pi / 180) * -1),
                        child: Image(
                          width: 5 ,
                          image: AssetImage("assets/images/"+this.mode+"/aiguille2.png"),
                          fit: BoxFit.contain,
                        ),)
                    ],
                  ),
                  Spaces(10),
                  Text("${horloge.hours} : ${horloge.minutes} : ${horloge.secondes}",
                      style: TextStyle(color: horloge.second),
                      textAlign: TextAlign.center
                  ),
                  Spaces(10),
                  ElevatedButton(
                    child: Text('$oppositemode'),
                    onPressed: () {ChangeMode();},
                  )
                ]
            )
        ),
      ),
    );
  }
}