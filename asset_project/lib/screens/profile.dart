import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/drawer.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
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
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
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
                          backgroundImage:
                              AssetImage("assets/images/syaza.png"),
                          radius: 45.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/fatin.png"),
                          radius: 45.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/shira.png"),
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
                          width: 8.0,
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 10.0),
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
                    infoChild(_width, Icons.domain, 'KSSF Legacy SDN BHD'),
                    infoChild(_width, Icons.email, 'KSSFLegacy@gmail.com'),
                    infoChild(_width, Icons.call, '+06-8764444678'),
                    infoChild(_width, Icons.location_city, 'Kuala Terengganu'),
                    infoChild(
                        _width, Icons.people, '45 Persons (FY March 2022)'),
                    infoChild(_width, Icons.sports_tennis,
                        'Collection of badminton item such as \n Racquets,Net, Shuttlecock and Shoes'),

                    //         Text(
                    //           'KSSF Legacy is aaaaaa \n'
                    //           'ssssssssssssssssssssj',
                    //           style: TextStyle(
                    //             fontSize: 18.0,
                    //             fontStyle: FontStyle.italic,
                    //             fontWeight: FontWeight.w300,
                    //             color: Colors.black,
                    //             letterSpacing: 2.0,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    new Padding(
                      padding: new EdgeInsets.only(top: _height / 10),
                      child: new Column(
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Widget infoChild(double width, IconData icon, data) => new Padding(
      padding: new EdgeInsets.only(bottom: 5.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new SizedBox(
              width: width / 10,
            ),
            new Icon(
              icon,
              color: const Color(0xFF0D47A1),
              size: 36.0,
            ),
            new SizedBox(
              width: width / 10,
            ),
            new Text(data)
          ],
        ),
        onTap: () {
          print('');
        },
      ),
    );

