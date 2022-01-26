import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact{
  final String name;
  final ImageIcon icon;
  

  const Contact(this.name,this.icon);

  static const contacts = [
    Contact('Shoes',ImageIcon(AssetImage('assets/images/icon_shose.png'),size: 60,)),
    Contact('Racket',ImageIcon(AssetImage('assets/images/racket.png'),size: 60,)),
    Contact('Shuttlecock',ImageIcon(AssetImage('assets/images/shuttlecock.png'),size: 60,)),
    Contact('Net',ImageIcon(AssetImage('assets/images/net.png'),size: 60,)),

  ];

}