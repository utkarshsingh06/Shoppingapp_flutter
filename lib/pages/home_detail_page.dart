import 'package:flutter/material.dart';
import 'package:myapp/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/homewidgets/addtocar.dart';
import '../widgets/themes.dart';
class HomedetailPage extends StatelessWidget {
  final Item catalog;
  const HomedetailPage({super.key,required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent,),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).p12(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make().p8(),
                        10.heightBox,
                        "this is a stupid product please avoid buying it bas paisa khate hai saale android is best baak sab chutiaap hai. Aur haa mera app ek din laakhon mei bikega aur nithendra laal jaise logo ko unhi paison se ladkiyan dilvaunga".text.textStyle(context.captionStyle).make().p16(),
                      ],
                    ).py64(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
