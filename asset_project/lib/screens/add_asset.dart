import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //import json
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';

class addAssetScreen extends StatelessWidget {
  TextEditingController asset_brand = TextEditingController();
  TextEditingController asset_status = TextEditingController();
  TextEditingController asset_location = TextEditingController();
  String _selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());



  final listOfName = ['Raket', 'Bulu Tangkis', 'Net', 'Kasut', 'Grip'];
  String dropdownValue = 'Raket';
  String asset_no = '';

  Future<void> addProduct() async {
    final url =
        'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'asset_no': asset_no,
          'asset_name': dropdownValue,
          'asset_brand': asset_brand.text,
          'date_registered': _selectedDate,
          'asset_location': asset_location.text,
          'asset_status': asset_status.text,
        }),
      );
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD ASSET'),
        //backgroundColor: Colors.redAccent,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  DropdownButtonFormField( //add name asset
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    style: const TextStyle(color: Colors.deepPurple),
                    elevation: 16,
                    decoration: InputDecoration(
                      labelText: "Select Asset Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (String? newValue) {
                      dropdownValue = newValue!;
                      setNo(dropdownValue);
                    },
                    items: listOfName.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select asset';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 20),
                  
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Sub Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Subname is required';
                      }
                      return null;
                    },
                    controller: asset_brand,
                    
                  ),

                 SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Asset Status",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    controller: asset_status,
                  ),
                  
                  SizedBox(height: 20),                  
                
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Asset Location",
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                    controller: asset_location,
                  ),


                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          "Add asset".toUpperCase(),
                          style: TextStyle(fontSize: 14)
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                            )
                          )
                        ),
                        onPressed: (){
                          if (dropdownValue == '') {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('No data'),
                                  content: Text('Something went wrong.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            } else {
                              addProduct();
                              Navigator.of(context).pop();
                            }},
                      ),

                      
                      SizedBox(width: 20),
                      
                     
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

void setNo(String name) {
    String nameNo;
    String asset_no;
    nameNo = name;

    if (name == 'Raket') {
      asset_no = '1';
      this.asset_no = asset_no;
    } else if (name == 'Bulu Tangkis') {
      asset_no = '2';
      this.asset_no = asset_no;
    } else if (name == 'Net') {
      asset_no = '3';
      this.asset_no = asset_no;
    } else if (name == 'Kasut') {
      asset_no = '4';
      this.asset_no = asset_no;
    } else if (name == 'Grip') {
      asset_no = '5';
      this.asset_no = asset_no;
    }
  }

}

  