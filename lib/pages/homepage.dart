import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:myapp/widgets/drawer.dart';
import '../models/catalogs.dart';
import '../widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";
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
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Catalogheader(),
                if(CatalogModel.products!=null && CatalogModel.products.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(child: CircularProgressIndicator(),)
              ],
            )
          ),
        )
      );
  }
}
class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Catalog app".text.xl5.bold.color(Colors.indigo).make(),
            "Recent products".text.xl2.color(Colors.black).make(),
          ],
    );
  }
}
class  CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    itemCount: CatalogModel.products.length,
    itemBuilder: (Context,index){
      final catalog = CatalogModel.products[index];
      return Catalogitem(catalog:catalog);
    },
  );
}
}
class Catalogitem extends StatelessWidget {
  final Item catalog;
  const Catalogitem({super.key, required this.catalog}):assert(catalog!=null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(catalog.image,).box.p16.color(Colors.white10).make(),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.bold.color(Colors.deepPurple).make(),
              catalog.desc.text.xl.make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder(),
                    )),
                    child: "Buy".text.make(),)
                ],
              )
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py(20);
  }
}


