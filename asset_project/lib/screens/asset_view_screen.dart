
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../widgets/contact_card.dart';
import '../widgets/drawer.dart';
import '../providers/crud_asset.dart';
import '../models/asset.dart';

class AssetViewScreen extends StatefulWidget {
  @override
  State<AssetViewScreen> createState() => _AssetViewScreen();
}

class _AssetViewScreen extends State<AssetViewScreen> {
  final Auth _auth = Auth();

  var _isInit = true;
  var _isLoading = false;
  List<Asset> asset = [];

  @override
  void didChangeDependencies() {
    // Will run after the widget fully initialise but before widget build

    if (_isInit) {
      // for the first time..!!

      setState(() {
        _isLoading = true;
      });

      //print('getting user details...');
      //_getUserNameAndPosition();
      Provider.of<CrudAssets>(context).getProductDetails().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<CrudAssets>(context, listen: false).getProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CrudAssets>(
      builder: (context, productData, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('ASSET LIST'),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
            ),
            drawer: AppDrawer(), //calling method UI drawer

            body: RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: Consumer<CrudAssets>(
                  builder: (ctx, productData, child) => Padding(
                        padding: EdgeInsets.all(8),
                        child: PageView.builder(
                          scrollDirection: Axis.vertical, //untuk scroll data
                          controller: PageController(
                              viewportFraction: .5), //size untuk display

                          itemCount:
                              productData.items.length, //kira panjang data
                          itemBuilder: (context, index) {
                            final borderColor =
                                Colors.accents[index % Colors.accents.length];

                            return ContactCard(
                              productData.items[index].id,
                              borderColor,
                              productData.items[index].asset_no,
                              productData.items[index].asset_name,
                              productData.items[index].asset_brand,
                              productData.items[index].date_registered,
                              productData.items[index].asset_location,
                              productData.items[index].asset_status,
                            );
                          },
                        ),
                      )),
            ));
      },
    );
  }
}
