
import 'package:flutter/material.dart';
import '../screens/add_asset.dart';
import '../screens/edit_asset.dart';
import 'package:provider/provider.dart';
import '../providers/crud_asset.dart';

class ContactCard extends StatelessWidget {
  final Color borderColor;
  final String id;
  final String asset_no;
  final String asset_name;
  final String asset_brand;
  final String date_registered;
  final String asset_status;
  final String asset_location;

  ContactCard(
      this.id,
      this.borderColor,
      this.asset_no,
      this.asset_name,
      this.asset_brand,
      this.date_registered,
      this.asset_status,
      this.asset_location);

  @override
  Widget build(BuildContext context) {

    final assetLoad = Provider.of<CrudAssets>(
      context,
      listen: false,

    ).findById(id);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            heightFactor: 1,
            alignment: Alignment.centerLeft,
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Row(
              children: <Widget> [
              
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.white,
                  onPressed: () {
                  
                    Navigator.of(context).pushNamed(EditAssetScreen.routeName,
                    arguments: id);
                  },
                ),
              
                IconButton(
                icon: Icon(Icons.delete),
                color: Colors.white,
                onPressed: () {
                  Provider.of<CrudAssets>(context,listen:false).update_Status(id, assetLoad);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addAssetScreen()),
                  );
                },
              ),
              ],
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
                          Icons.sports_tennis,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: asset_name,
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      //text: '\n${contact.role}',
                                      style: TextStyle(color: Colors.black)),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bookmark,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: asset_brand,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: date_registered,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: asset_status,
                                style: TextStyle(color: Colors.black)),
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
                                text: asset_location,
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