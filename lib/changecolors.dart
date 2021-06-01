import 'package:flutter/material.dart';
import 'ressources/block.dart';
import 'ressources/navbar.dart';

class ChangeColor extends StatefulWidget {
  ChangeColor({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _ChangeColor createState() => _ChangeColor();
}

class _ChangeColor extends State<ChangeColor> {

  Color actual = Colors.blue;
  void _updatecolor(newcolor) {
    setState(() {
      if(newcolor == "green")
        this.actual = Colors.green;
      if(newcolor == "pink")
        this.actual = Colors.pink;
      if(newcolor == "blue")
        this.actual = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Change Me !')
      ),
      drawer: MyDrawer(),

      body: Container(
          color: this.actual,
          child:Center(
              child : Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width/1.1,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : <Widget>[
                         Column(
                            children: <Widget>[
                              Text("Whats is My Color",
                                  style: TextStyle(color: Colors.black,fontSize: 30.0),
                                  textAlign: TextAlign.center),
                              Spaces(10),
                              Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        child: Text('Green'),
                                        onPressed: () {_updatecolor("green");},
                                      ),
                                      Spaces(5),
                                      ElevatedButton(
                                        child: Text('Blue'),
                                        onPressed: () {_updatecolor("blue");},
                                      ),
                                      Spaces(5),
                                      ElevatedButton(
                                        child: Text('Pink'),
                                        onPressed: () {_updatecolor("pink");},
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text("Right"),
                            ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("Center"),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Left"),
                        ),
                      ]
                    )
              )
          )
      )
    );
  }
}