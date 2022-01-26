import 'package:flutter/material.dart';

class Asset with ChangeNotifier{
  final String id;
  final String asset_no;
  final String asset_name;
  final String asset_brand;
  final String date_registered;
  final String asset_status;
  final String asset_location;

   Asset(
      {required this.id,
      required this.asset_no,
      required this.asset_name,
      required this.asset_brand,
      required this.date_registered,
      required this.asset_status,
      required this.asset_location});
}
