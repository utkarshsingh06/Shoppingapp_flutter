import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';
class MyStore extends VxStore {
  CatalogModel catalog=CatalogModel();
  CartModel cart=CartModel();
  MyStore() {
    cart.catalog = catalog;
  }
}

