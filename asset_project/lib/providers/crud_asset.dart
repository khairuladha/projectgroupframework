import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/asset.dart';
import '../models/http_exception.dart';

class CrudAssets with ChangeNotifier {
  List<Asset> _items = [];

  //CrudAssets(this._items);

  late final String? authToken;
  late final String? userId;

  CrudAssets(this.authToken, this.userId, this._items);

  List<Asset> get items {
    return [..._items];
  }

  Asset findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> getProductDetails([bool filter = false]) async {
    var url =
        'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets.json';
    try {
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));

      if (json.decode(response.body) != null) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        final List<Asset> loadProducts = [];
        int num = 0;
        String code;
        extractedData.forEach((prodNo, prodData) {
          loadProducts.add(Asset(
            id: prodNo,
            asset_name: prodData['asset_name'],
            asset_brand: prodData['asset_brand'],
            date_registered: prodData['date_registered'],
            asset_location: prodData['asset_location'],
            asset_status: prodData['asset_status'],
            asset_no: prodData['asset_no'],
          ));
        });
        print(_items);
        _items = loadProducts;
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  // Future<void> deleteProduct(String asset_no) async {
  //   final url =
  //       'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets/$asset_no.json?auth=$authToken';
  //   final existingProductIndex = _items.indexWhere((prod) => prod.asset_no == asset_no);
  //   var existingProduct = _items[existingProductIndex];
  //   _items.removeAt(
  //       existingProductIndex); // This approach know as optimistic updating..
  //   notifyListeners();

  //   final response = await http.delete(Uri.parse(url));
  //   if (response.statusCode >= 400) {
  //     _items.insert(existingProductIndex,
  //         existingProduct); // Rollback to data in the list if error occurs..!
  //     notifyListeners();
  //     throw HttpException('Could not delete the product.');
  //   }
  //   //  existingProduct = null;
  //   existingProduct = <Asset>[] as Asset; // Reset a default value as null
  // }

  Future<void> addProduct(
      String asset_no,
      String dropdownValue,
      String asset_brand,
      String _selectedDate,
      String asset_location,
      String asset_status) async {
    final total = items.length + 1;
    String assetNo = 'A-' + total.toString();
    final url =
        'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'asset_no': 'A-' + total.toString(),
          'asset_name': dropdownValue,
          'asset_brand': asset_brand,
          'date_registered': _selectedDate,
          'asset_location': asset_location,
          'asset_status': asset_status,
        }),
      );

      Asset asset = Asset(
        id: json.decode(response.body)['name'],
        asset_no: 'A-' + total.toString(),
        asset_name: dropdownValue,
        asset_brand: asset_brand,
        date_registered: _selectedDate,
        asset_location: asset_location,
        asset_status: asset_status,
      );
      _items.add(asset);
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> update_Status(String id, Asset newAsset) async {
    final assetIndex = _items.indexWhere((ast) => ast.id == id);
    if (assetIndex >= 0) {
      var url =
          'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets/$id.json';

      final response = await http.patch(
        Uri.parse(url),
        body: jsonEncode({
          'asset_no': newAsset.asset_no,
          'asset_name': newAsset.asset_name,
          'asset_brand': newAsset.asset_brand,
          'date_registered': newAsset.date_registered,
          'asset_location': newAsset.asset_location,
          'asset_status': 'Deprecated',
        }),
      );
      print(newAsset.asset_no + "status update = Deprecated");

      _items[assetIndex] = newAsset;
      notifyListeners();
    } else {
      print('...');
    }
  }

  

  Future<void> updateAsset(String id, Asset newAsset) async {
    final assetIndex = _items.indexWhere((prod) => prod.id == id);
    if (assetIndex >= 0) {
      final url =
          'https://badminton-75d70-default-rtdb.asia-southeast1.firebasedatabase.app/assets/$id.json';
      await http.patch(Uri.parse(url),
          body: jsonEncode({
          'asset_no': newAsset.asset_no,
          'asset_name': newAsset.asset_name,
          'asset_brand': newAsset.asset_brand,
          'date_registered': newAsset.date_registered,
          'asset_location': newAsset.asset_location,
          'asset_status': newAsset.asset_status,
          }));

          print(newAsset.asset_no + "asset update  "+ newAsset.asset_location);
      _items[assetIndex] = newAsset;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
