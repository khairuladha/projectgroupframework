import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';

class addAssetScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final listOfName = ['Raket', 'Bulu Tangkis', 'Net', 'Kasut', 'Grip'];
  late DateTime _selectedDate = DateTime.now();

  String dropdownValue = 'Raket';
  late String asset_no;
  late String asset_name;
  late String asset_subName;
  late String asset_location;
  late String asset_status;

/////////////////////////////////////
  ///     FUNCTION
/////////////////////////////////////

  var _isInit = true;
  var _isLoading = false;

/////////////////////////////////////
  ///     WIDGET FORM
/////////////////////////////////////

  Widget _buildName() {
    return DropdownButtonFormField(
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
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: listOfName.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please Select Pet';
        }
        return null;
      },
    );
  }

  Widget _buildSubName() {
    return TextFormField(
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
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buildRegistered(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0), // Set border width
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _selectedDate == null
                  ? ' Registaration date no set '
                  : ' Registaration asset: ${DateFormat.yMd().format(_selectedDate)}',
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030))
                    .then((DateTime? value) {
                  if (value != null) {
                    setState(() {
                      _selectedDate = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Select date: $_selectedDate')),
                    );
                  }
                });
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 24.0,
              ),
              label: Text('Calendar'))
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Asset Location",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'location is required';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buildStatus() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Status",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'status is required';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buildNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'no'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'no is required';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buttonSubmit() {
    return FlatButton(
      child: Text("Submit"),
      textColor: Colors.white,
      color: Colors.blueAccent,
      onPressed: () {
        // if (_formKey.currentState.validate()) {
        //   _formKey.currentState.save();
        // }
      },
    );
  }

///////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD ASSET'),
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
      body: _isLoading
          ? Center()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildName(),
                        SizedBox(height: 10),
                        _buildSubName(),
                        SizedBox(height: 10),
                        _buildRegistered(context),
                        SizedBox(height: 10),
                        _buildLocation(),
                        SizedBox(height: 10),
                        _buildStatus(),
                        SizedBox(height: 10),
                        _buttonSubmit(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void setState(Null Function() param0) {}
}
