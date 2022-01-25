import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../providers/contact.dart';
//import 'contact_card.dart';

class AssetList extends StatelessWidget {
  //class for list data

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          //widget listdata
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: Contact.contacts.length, //kira data dlm table db
          itemBuilder: (BuildContext context, index) {
            final contact = Contact.contacts[index]; //mklumat data dlm table

            return GestureDetector(
                onTap: () {
                  print("Click event on Container");
                  //Navigator.of(context).pushNamed("asdasd");
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(18)),
                  // ),

                  child: Card(
                    elevation: 10,
                    color: RandomColorModel().getColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        contact.icon,
                        Text(contact.name,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            textAlign: TextAlign.center),
                        // leading: CircleAvatar(
                        //     backgroundImage: NetworkImage( "https://images.unsplash.com/photo-1547721064-da6cfb341d50")
                        // ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}

class RandomColorModel {
  //class untuk tukar warna grid view
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(500),
        random.nextInt(500), random.nextInt(500));
  }
}
