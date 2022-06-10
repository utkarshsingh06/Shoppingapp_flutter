import 'package:flutter/material.dart';
import 'package:myapp/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../pages/home_detail_page.dart';
import '../themes.dart';
import 'catalog_image.dart';
class  CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (Context,index){
        final catalog = CatalogModel.products[index];
        return InkWell(
          onTap: ()=> Navigator.push(context,MaterialPageRoute(builder:( context)=>HomedetailPage(catalog: catalog,)
          ),
          ),
            child: Catalogitem(catalog:catalog));
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
            Hero(
              tag: Key(catalog.id.toString()),
              child: Catalogimage(
                image: catalog.image,
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.color(context.accentColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){},style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.theme.buttonColor),
                          shape: MaterialStateProperty.all(StadiumBorder(),
                          )),
                        child: "Add to Cart".text.make(),),
                  ],
                ).pOnly(right: 5.0)
              ],
            ))
          ],
        ),
      ).color(context.cardColor).roundedLg.square(150).make().py(16);
  }
}
