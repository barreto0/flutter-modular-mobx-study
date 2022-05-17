import 'package:flutter/material.dart';
import '../../inner/Stores/cart.store.dart';
import 'cart_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class CartViewModel extends State<CartScreen> {
  final cartStore = Modular.get<Cart>();
  @override
  void initState() {
    super.initState();
  }
}
