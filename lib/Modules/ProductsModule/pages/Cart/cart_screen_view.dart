import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../Common/Widgets/custom_app_bar.dart';
import 'cart_screen_view_model.dart';

class CartView extends CartViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        backgroundColor: Colors.white,
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: cartStore.cart.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: ListTile(
                    trailing: Text(
                      "U\$ ${cartStore.cart[index].price}",
                      style: const TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("${cartStore.cart[index].title}")),
              );
            },
          ),
        ));
  }
}
