import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../providers/contact.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(
      {Key? key, required this.borderColor, required this.contact})
      : super(key: key);

  final Color borderColor;
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: const Text('detail Asset'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //Navigator.of(context).pushNamed('EditProductScreen.routeName');//page add
            },
          ),
        ],
      ),
    
      drawer: Drawer(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            heightFactor: 1,
            alignment: Alignment.centerLeft,
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: contact.name,
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: '\n${contact.role}',
                                      style: TextStyle(color: Colors.black)),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                //text: contact.address,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.call_outlined,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                //text: contact.phone,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                //text: contact.email,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    
    
    );
  }
}

// Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   Align(
      //     heightFactor: 1,
      //     alignment: Alignment.centerLeft,
      //     child: Container(
      //       height: 30,
      //       width: 70,
      //       decoration: BoxDecoration(
      //         color: borderColor,
      //         borderRadius: BorderRadius.vertical(
      //           top: Radius.circular(10),
      //         ),
      //       ),
      //       child: Icon(
      //         Icons.add,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   Expanded(
          
      //     child: Container(
      //       width: double.infinity,
      //       padding: const EdgeInsets.all(15),
      //       decoration: BoxDecoration(
      //         color: borderColor,
      //         borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(20),
      //           bottomRight: Radius.circular(20),
      //           topRight: Radius.circular(20),
      //         ),
      //       ),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         padding: const EdgeInsets.all(10),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.person_outline,
      //                   size: 40,
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 Flexible(
      //                   child: Text.rich(
      //                     TextSpan(
      //                         text: contact.name,
      //                         style: TextStyle(color: Colors.black),
      //                         children: [
      //                           TextSpan(
      //                               text: '\n${contact.role}',
      //                               style: TextStyle(color: Colors.black)),
      //                         ]),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.home_outlined,
      //                   size: 40,
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 Flexible(
      //                   child: Text.rich(
      //                     TextSpan(
      //                         text: contact.address,
      //                         style: TextStyle(color: Colors.black)),
      //                   ),
      //                 ),
      //               ],
      //             ),

      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.call_outlined,
      //                   size: 40,
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 Flexible(
      //                   child: Text.rich(
      //                     TextSpan(
      //                         text: contact.phone,
      //                         style: TextStyle(color: Colors.black)),
      //                   ),
      //                 ),
      //               ],
      //             ),
                  
      //             Row(
      //               children: [
      //                 Icon(
      //                   Icons.mail_outline,
      //                   size: 40,
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 Flexible(
      //                   child: Text.rich(
      //                     TextSpan(
      //                         text: contact.email,
      //                         style: TextStyle(color: Colors.black)),
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
//     );