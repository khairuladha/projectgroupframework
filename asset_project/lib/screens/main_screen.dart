import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/assets_list.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INVENTORY'),
        // leading: IconButton(onPressed: (){},
        //  icon:Icon(Icons.menu),
        //  ),
        //  actions: [
        //    IconButton(onPressed: (){
        //      AppDrawer();
        //    },
        //     icon: Icon(Icons.search),
        //     ),
        //  ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
        ),
      ),

      drawer: AppDrawer(), //calling method UI drawer

      body: AssetList(),
      // PageView.builder(
      //   scrollDirection: Axis.vertical, //untuk scroll data
      //   controller: PageController(viewportFraction: .5), //size untuk display

      //   itemCount: Contact.contacts.length, //kira panjang data
      //   itemBuilder: (context, index) {
      //     final contact = Contact.contacts[index];
      //     final borderColor = Colors.accents[index % Colors.accents.length];
      //     return ContactCard(
      //       borderColor: borderColor,
      //       contact: contact,
      //     );
      //   },
      // ),
    );
  }
}
