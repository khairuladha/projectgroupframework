
import 'package:asset_project/models/asset.dart';
import 'package:asset_project/providers/crud_asset.dart';
import 'package:asset_project/screens/asset_view_screen.dart';
import 'package:asset_project/screens/edit_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/auth_screen.dart';
import './screens/main_screen.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),   
        ChangeNotifierProxyProvider<Auth, CrudAssets>(
          create: (ctx) => CrudAssets(null, null,
              []), //Note: for dependencies version is version 4.00 above (in pubspec.yaml)=> must issue create:
          update: (ctx, auth, previousProducts) => CrudAssets(
            //Note: for dependencies version is version 4.00 above (in pubspec.yaml)=> must use :update NOT a :builder..!
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        // ChangeNotifierProvider.value(
        //   value: Cart(),
        // ),
        // ChangeNotifierProxyProvider<Auth, Orders>(
        //   create: (ctx) => Orders(null,null,
        //       []), //Note: for dependencies version is version 4.00 above (in pubspec.yaml)=> must issue create:
        //   update: (ctx, auth, previousOrders) => Orders(
        //     //Note: for dependencies version is version 4.00 above (in pubspec.yaml)=> must use :update NOT a :builder..!
        //     auth.token, auth.userId,
        //     previousOrders == null ? [] : previousOrders.orders,
        //   ),
        // ),

      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => (MaterialApp(
          title: 'Badminton Assets',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.lightBlue,
            fontFamily: 'Lato',
            textTheme: const TextTheme(
              // accentTextTheme: Colors.black,
              subtitle1: TextStyle(color: Colors.black),
              subtitle2: TextStyle(color: Colors.black),
              headline1: TextStyle(color: Colors.purple),
            ),
            accentTextTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.black),
            ),
          ),
          //home: AuthScreen(),
          home: auth.isAuth ? AssetViewScreen() : AuthScreen(),
          
          routes: {
             EditAssetScreen.routeName: (ctx) => EditAssetScreen(),
          //   CartScreen.routeName: (ctx) => CartScreen(),
          //   OrdersScreen.routeName: (ctx) => OrdersScreen(),
          //   UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          //   EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },

        )),
      ),

      // MaterialApp(
      //     title: 'MyShop',
      //     theme: ThemeData(
      //       primarySwatch: Colors.purple,
      //       accentColor: Colors.deepOrange,
      //       fontFamily: 'Lato',
      //       textTheme: const TextTheme(
      //         // accentTextTheme: Colors.black,
      //         subtitle1: TextStyle(color: Colors.black),
      //         subtitle2: TextStyle(color: Colors.black),
      //         headline1: TextStyle(color: Colors.purple),
      //       ),
      //       accentTextTheme: const TextTheme(
      //         subtitle1: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //     home: AuthScreen(),
      //     routes: {
      //       ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      //       CartScreen.routeName: (ctx) => CartScreen(),
      //       OrdersScreen.routeName: (ctx) => OrdersScreen(),
      //       UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
      //       EditProductScreen.routeName: (ctx) => EditProductScreen(),
      //     }),
    );
  }
}


