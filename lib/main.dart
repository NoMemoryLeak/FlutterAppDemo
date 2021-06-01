import 'package:flutter/material.dart';
import 'home.dart';
import 'positions.dart';
import 'like.dart';
import 'boussole.dart';
import 'horlogetexte.dart';
import 'horlogedarkmode.dart';
import 'changecolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.purple,

        // Define the default font family.
        fontFamily: 'Georgia',
        // Text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=>MyHomePage(title: 'Home'),
        '/positions' : (context)=> Positions(title: 'Positions'),
        '/likebars'  : (context)=> Like(title: 'Likes'),
        '/changecolor': (context)=>ChangeColor(title: 'ChangeColor'),
        '/boussoles' : (context)=>Boussole(title: 'Boussole'),
        '/horlogetext': (context)=>HorlogeTexte(title: 'HorlogeTexte'),
        '/horloge': (context)=>HorlogeDarkMode(title: 'Horloge'),
      },
    );
  }
}

