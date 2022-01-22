import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/drawer.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COMPANY PROFILE'),
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
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.redAccent])),
              child: Container(
                width: double.infinity,
                height: 40.0,
                child: Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "KSSF LEGACY",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.blueAccent])),
              child: Container(
                width: double.infinity,
                height: 150.0,
                child: Center(
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/syaza.png"),
                        radius: 45.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/fatin.png"),
                        radius: 45.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/shira.png"),
                        radius: 45.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/adha.png"),
                        radius: 45.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Background Company",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'KSSF Legacy is aaaaaa \n'
                    'ssssssssssssssssssssj',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.blue, Colors.blueAccent]),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Contact us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
