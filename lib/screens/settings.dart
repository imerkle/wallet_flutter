import 'package:flutter/material.dart';
import 'package:wallet_flutter/utils/fn.dart';



void x(String a){
  
}

class Settings extends StatelessWidget{
  @override
  Widget build(context){
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Connect to Web"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => A()),
            );
          },
        ),
      ],
    );
  }
}

class A extends StatefulWidget{

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  
  void initState() {
    scan(x);
    super.initState();
  }

  @override
  Widget build(context){
    return Container();
  }
}