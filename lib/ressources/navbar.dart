import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  String _nametitle;
  String _email;
  Navbar(this._nametitle,this._email);
  @override
  Widget build(BuildContext context) {
    return  UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.purple),
      accountName: Text(_nametitle),
      accountEmail: Text(_email),
      currentAccountPicture: CircleAvatar(
        child: Icon(
          Icons.person,
          size: 50,
        ),
      ),
    );
  }
}

class ListTheme extends StatelessWidget
{
  String _nametitle;
  String _namepage;
  IconData _icons;
  ListTheme(this._nametitle,this._icons,this._namepage);
  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      leading: Icon(_icons,color: Colors.purple, size: 24.0,),
      title: Text(_nametitle),
      onTap: () {Navigator.pushNamed(context, _namepage);}
    );
  }
}

class MyDrawer extends StatelessWidget
{
  MyDrawer();
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Navbar('NoMemoryLeak','esiea.fr'),
              ListTheme("Home",Icons.house,'/'),
              ListTheme("Positions",Icons.message,'/positions'),
              ListTheme("Like",Icons.favorite,'/likebars'),
              ListTheme("Colors",Icons.format_paint,'/changecolor'),
              ListTheme("Boussole",Icons.map,'/boussoles'),
              ListTheme("Horloge Texte",Icons.access_time_outlined,'/horlogetext'),
              ListTheme("Horloge DarkMode",Icons.more_time,'/horloge'),
            ])
    );
  }
}