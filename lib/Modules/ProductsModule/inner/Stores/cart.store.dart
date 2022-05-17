import 'package:flutter_modular_study/Modules/ProductsModule/models/ProductModel.dart';
import 'package:mobx/mobx.dart';
part 'cart.store.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  @observable
  List<ProductModel> cart = [];

  @action
  addToCart(ProductModel product) {
    cart.add(product);
  }
}
