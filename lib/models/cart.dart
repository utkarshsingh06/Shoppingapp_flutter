import 'package:myapp/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalogs.dart';
import 'package:myapp/models/catalogs.dart';
class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => CatalogModel.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}
class Addmutation extends VxMutation<MyStore>{
  final Item item;
  Addmutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}
class Removemutation extends VxMutation<MyStore>{
  final Item item;
  Removemutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}