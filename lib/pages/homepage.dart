import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:myapp/widgets/drawer.dart';
import '../models/catalogs.dart';
import '../widgets/item_widget.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: Text("Catalogue App",style: TextStyle(color: Colors.black,fontSize: 25,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: (CatalogModel.products != null&& CatalogModel.products.isNotEmpty )? ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index){
            return ItemWidget(
              items: CatalogModel.products[index],
            );
          }
        )
        : const Center(
          child: CircularProgressIndicator(),
        ),
        ),
        drawer: Mydrawer(),
      );}
}
