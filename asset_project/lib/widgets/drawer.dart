import 'package:asset_project/screens/profile.dart';
import 'package:flutter/material.dart';
import '../screens/add_asset.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import '../screens/profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('BADMINTON ASSETS'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/'); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Company Profile',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => profile())); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text(
              'Add Asset',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          addAssetScreen())); //nnti letak page sini
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
