
import 'package:asset_project/models/asset.dart';
import 'package:asset_project/screens/asset_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';
import '../providers/crud_asset.dart';

class EditAssetScreen extends StatefulWidget {
  static const routeName = '/editScreen';
  @override
  _EditAssetScreen createState() => _EditAssetScreen();
}
class _EditAssetScreen extends State<EditAssetScreen> {

  String _selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
   final _form = GlobalKey<FormState>();
   final _NameFocusNode = FocusNode();
  final _brandFocusNode = FocusNode();
  final _StatusFocusNode = FocusNode();
  final _LocationFocusNode = FocusNode();

  var _editedAsset = Asset(
    id:'',
    asset_no:'',
    asset_name:'',
    asset_brand:'',
    date_registered:'',
    asset_status:'',
    asset_location:'',

  );
  var _iniAsset = {
 
    'asset_no'       : '',
    'asset_name'     : '',
    'asset_brand'    : '',
    'date_registered': '',
    'asset_status'   : '',
    'asset_location' : '',

  };

  final listOfName = ['Racket', 'Shuttlecock', 'Net', 'Shoes', 'Grip'];
  String dropdownValue = 'Racket';
  String asset_no = '';

  final listOfStatus = ['Active', 'InActive', ];
  String dropdownStatus = 'Active';

  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    _editedAsset =Provider.of<CrudAssets>(context, listen: false).findById(productId);
    _iniAsset = {
      'asset_no'       : _editedAsset.asset_no,
      'asset_name'     : _editedAsset.asset_name,
      'asset_brand'    : _editedAsset.asset_brand,
      'date_registered': _editedAsset.date_registered,
      'asset_status'   : _editedAsset.asset_status,
      'asset_location' : _editedAsset.asset_location,
    };

      @override
  void dispose() {
   
    _NameFocusNode.dispose();
    _brandFocusNode.dispose();
    _StatusFocusNode.dispose();
    _LocationFocusNode.dispose();
    super.dispose();
  }


    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT ASSET'),
        //backgroundColor: Colors.redAccent,
      ),
      drawer: AppDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Form(
                key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),

                  TextFormField(
                      initialValue: _iniAsset['asset_name'],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_NameFocusNode);
                      },
                      readOnly: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedAsset = Asset(
                          id:_editedAsset.id,
                          asset_no:_editedAsset.asset_no,
                          asset_name: value!,
                          asset_brand:_editedAsset.asset_brand,
                          date_registered:_editedAsset.date_registered,
                          asset_status:_editedAsset.asset_status,
                          asset_location:_editedAsset.asset_location,
                            
                            );
                      },
                    ),
                  
                  SizedBox(height: 20),
                  
                  TextFormField(
                      initialValue: _iniAsset['asset_brand'],
                      decoration: InputDecoration(labelText: 'Brand'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_brandFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedAsset = Asset(
                          id:_editedAsset.id,
                          asset_no:_editedAsset.asset_no,
                          asset_name: _editedAsset.asset_name,
                          asset_brand:value!,
                          date_registered:_editedAsset.date_registered,
                          asset_status:_editedAsset.asset_status,
                          asset_location:_editedAsset.asset_location,
                            
                            );
                      },
                    ),

                 SizedBox(height: 20),

                 DropdownButtonFormField(
                    //add name asset
                    value: dropdownStatus,
                    icon: Icon(Icons.arrow_downward),
                    style: const TextStyle(color: Colors.black),
                    elevation: 16,
                    decoration: InputDecoration(
                      labelText: "Select Status",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (String? newStatus) {
                      dropdownStatus = newStatus!;
                    },
                    items: listOfStatus.map((String status) {
                      return new DropdownMenuItem<String>(
                        value: status,
                        child: new Text(status),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Status';
                      }
                      return null;
                    },
                     onSaved: (value) {
                        _editedAsset = Asset(
                          id:_editedAsset.id,
                          asset_no:_editedAsset.asset_no,
                          asset_name: _editedAsset.asset_name,
                          asset_brand:_editedAsset.asset_brand,
                          date_registered:_editedAsset.date_registered,
                          asset_status:dropdownStatus,
                          asset_location:_editedAsset.asset_location,
                            
                            );
                     },
                  ),

                  
                  
                  SizedBox(height: 20),                  
                
                  TextFormField(
                      initialValue: _iniAsset['asset_location'],
                      decoration: InputDecoration(labelText: 'Location'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_LocationFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedAsset = Asset(
                          id:_editedAsset.id,
                          asset_no:_editedAsset.asset_no,
                          asset_name: _editedAsset.asset_name,
                          asset_brand:_editedAsset.asset_brand,
                          date_registered:_editedAsset.date_registered,
                          asset_status:_editedAsset.asset_status,
                          asset_location:value!,
                            
                            );
                      },
                    ),


                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          "Edit asset".toUpperCase(),
                          style: TextStyle(fontSize: 14)
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)
                            )
                          )
                        ),
                        onPressed: () {
                          Provider.of<CrudAssets>(context,listen:false)
                            .updateAsset(_editedAsset.id, _editedAsset);
                          Navigator.of(context).pop();
                          //   context,
                          // MaterialPageRoute(builder: (context) => AssetViewScreen()),
                  
                },

                       
                      ),

                      
                      SizedBox(width: 20),
                      
                     
                    ],
                  ),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// void setNo(String name) {
//     String nameNo;
//     String asset_no;
//     nameNo = name;

//     if (name == 'Raket') {
//       asset_no = '1';
//       this.asset_no = asset_no;
//     } else if (name == 'Bulu Tangkis') {
//       asset_no = '2';
//       this.asset_no = asset_no;
//     } else if (name == 'Net') {
//       asset_no = '3';
//       this.asset_no = asset_no;
//     } else if (name == 'Kasut') {
//       asset_no = '4';
//       this.asset_no = asset_no;
//     } else if (name == 'Grip') {
//       asset_no = '5';
//       this.asset_no = asset_no;
//     }
//   }

}

  