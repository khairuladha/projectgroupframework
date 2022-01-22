import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact{
  final String name;
  final String role;
  final ImageIcon icon;
  

  const Contact(this.name, this.role,this.icon);

  static const contacts = [
    Contact('Shoes','Supervisor',ImageIcon(AssetImage('assets/images/icon_shose.png'),size: 60,)),
    Contact('Racket','balaci',ImageIcon(AssetImage('assets/images/icon_shose.png'),size: 60,)),
    Contact('Shuttlecock','pencuci najis',ImageIcon(AssetImage('assets/images/icon_shose.png'),size: 60,)),
    Contact('Net','pengutip hutang',ImageIcon(AssetImage('assets/images/icon_shose.png'),size: 60,)),

  ];

}