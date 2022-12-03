import 'package:demo_project/models/catalog.dart';

class CartModel {
  CatalogModel _catalog = CatalogModel();
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  final List<int> _lstIds = [];

  List<Item> get items => _lstIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _lstIds.add(item.id);
  }

  void remove(Item item) {
    _lstIds.remove(item.id);
  }
}
