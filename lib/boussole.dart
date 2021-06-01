import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'ressources/navbar.dart';

class Boussole extends StatefulWidget {
  Boussole({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _Boussole createState() => _Boussole();
}

class _Boussole extends State<Boussole> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Find The North !')
      ),
      drawer: MyDrawer(),
      body:
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCompass(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _buildCompass() {
  return StreamBuilder<CompassEvent>(
    stream: FlutterCompass.events,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error reading heading: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      double? direction = snapshot.data!.heading;
      // if direction is null, then device does not support this sensor
      // show error message
      if (direction == null)
        return Center(
          child: Text("Device does not have sensors !"),
        );

      return Column(
          children: <Widget>[
            Stack(
              alignment: const Alignment(0, 0),
              children: [
                Image(
                  //decoration: BoxDecoration(border: Border.all()),
                  width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/10 ,
                  image: AssetImage("assets/images/graduation.jpg"),
                  fit: BoxFit.contain,
                ),

                Transform.rotate(
                  angle: (direction * (math.pi / 180) * -1),
                  child: Image(
                    //decoration: BoxDecoration(border: Border.all()),
                    width: MediaQuery.of(context).size.width/1.5,
                    image: AssetImage("assets/images/boussole.png"),
                    fit: BoxFit.contain,
                  ),)
              ],
            ),
            Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  Text(
                    'Degres ${direction.toInt()} °',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ]
            )
          ]
      );
    },
  );
}