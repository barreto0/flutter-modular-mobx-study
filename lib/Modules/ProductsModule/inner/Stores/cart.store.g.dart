// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Cart on _Cart, Store {
  late final _$cartAtom = Atom(name: '_Cart.cart', context: context);

  @override
  List<ProductModel> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<ProductModel> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$_CartActionController =
      ActionController(name: '_Cart', context: context);

  @override
  dynamic addToCart(ProductModel product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
