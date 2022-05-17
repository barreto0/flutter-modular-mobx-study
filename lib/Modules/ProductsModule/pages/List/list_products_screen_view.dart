import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/Common/Widgets/custom_app_bar.dart';
import '../../../../Core/Extensions/color_to_hex.dart';
import 'list_products_screen_view_model.dart';

class ProductsListView extends ProductsListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Products'),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/products/cart');
        },
        backgroundColor: HexColor.fromHex("#F48225"),
        child: const Icon(Icons.shopping_cart),
      ),
      body: loadingProducts
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    showAddToCartDialog(index);
                  },
                  child: ListTile(
                      trailing: Text(
                        "U\$ ${products[index].price}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("${products[index].title}")),
                );
              },
            ),
    );
  }
}
