import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/inner/Stores/cart.store.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/inner/products_repository.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/models/ProductModel.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/pages/Widgets/add_to_cart_dialog.dart';
import 'list_products_screen.dart';

abstract class ProductsListViewModel extends State<ProductsList> {
  final ProductRepository _productRepository = ProductRepository();
  final _cartStore = Modular.get<Cart>();

  List<ProductModel> products = [];
  bool loadingProducts = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  showAddToCartDialog(int indexOfSelectedProductToAdd) {
    showDialog(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      barrierDismissible: true,
      builder: (context) {
        return const AddToCartDialog();
      },
    ).then((value) =>
        value ? addProductToCart(indexOfSelectedProductToAdd) : null);
  }

  addProductToCart(int indexOfSelectedProductToAdd) {
    ProductModel product = products[indexOfSelectedProductToAdd];
    _cartStore.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text('Produto ${product.title} adicionado ao carrinho com sucesso'),
    ));
  }

  Future<void> getProducts() async {
    setState(() {
      loadingProducts = true;
    });
    List<ProductModel> productList = await _productRepository.getProductList();
    setState(() {
      products = productList;
      loadingProducts = false;
    });
  }
}
