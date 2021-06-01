import 'package:flutter/material.dart';
import 'ressources/navbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Train Your Skill !')
      ),
      drawer: MyDrawer(),

      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Text('Nb Clic : $_counter',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center
                  ),
                  ElevatedButton(
                    child: Text('Open route'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/likebars');
                    },
                  )
              ],
                )
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}