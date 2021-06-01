import 'package:flutter/material.dart';
import 'ressources/navbar.dart';
import 'ressources/block.dart';

class Like extends StatefulWidget {
  Like({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _Like createState() => _Like();
}

class _Like extends State<Like> {

  //Boutton
  int _like=0, _dislike=0,_init=1;
  void increase_like()
  {
    setState((){
      _like++;
      _init=0;});
  }
  void increase_dislike()
  {
    setState((){
      _dislike++;
      _init=0;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Like & Flex !')
      ),
      drawer: MyDrawer(),

      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                children: <Widget>[
                  Flexible(flex:_init,child: Block(Colors.grey, null, 20)),
                  Flexible(flex:_like,child: Block(Colors.blue, null, 20)),
                  Flexible(flex:_dislike,child: Block(Colors.red, null, 20))]
            ),
            Text("like : $_like | dislike : $_dislike"),
            Container(
              child:Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(onPressed: increase_like   , child: Icon(Icons.thumb_up)),
                          ElevatedButton(onPressed: increase_dislike, child: Icon(Icons.thumb_down)),
                        ]
                    ),
                  )
              ),
            ),
        ])
    );
  }
}