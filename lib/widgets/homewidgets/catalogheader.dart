import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

import '../themes.dart';
class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Catalog app".text.xl5.bold.color(context.theme.buttonColor).make(),
            "Recent products".text.xl2.make(),
          ],
      );
  }
}