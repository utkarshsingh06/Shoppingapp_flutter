import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:myapp/store/store.dart';
import 'package:myapp/utils/routes.dart';
import '../models/cart.dart';
import '../models/catalogs.dart';
import "package:velocity_x/velocity_x.dart";
import '../widgets/homewidgets/catalogheader.dart';
import '../widgets/homewidgets/cataloglist.dart';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds : 3));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData =decodeData["product"];
    CatalogModel.products  = List.from(productData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
      return Scaffold(
          backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {Addmutation,Removemutation},
          builder: (BuildContext context, store, VxStatus? status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context,myroutes.CartRoute),
              backgroundColor:context.theme.buttonColor,
          child:Icon(
              CupertinoIcons.cart,
          color: Colors.white,
          ),
          ).badge(color: Colors.pink,size: 20,count: _cart.items.length,textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Catalogheader(),
                if(CatalogModel.products!=null && CatalogModel.products.isNotEmpty)
                  CatalogList().py16().expand()
                else
                   CircularProgressIndicator().centered().expand(),
              ],
            )
          ),
        )
      );
  }
}
