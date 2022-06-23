import 'package:flutter/material.dart';
import 'package:myapp/store/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalogs.dart';
class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  }) ;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Addmutation,Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart =_cart.items.contains(catalog) ;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart) {
          Addmutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}