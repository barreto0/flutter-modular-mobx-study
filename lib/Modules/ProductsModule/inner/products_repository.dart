import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Core/Services/api_service.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/models/ProductModel.dart';

class ProductRepository {
  final ApiService _service = Modular.get<ApiService>();
  final String productsUrl = "https://fakestoreapi.com/products";

  List<ProductModel> processProductList(json) {
    List<ProductModel> products = [];
    for (int i = 0; i < json.length; i++) {
      ProductModel product = ProductModel.fromJson(json[i]);
      products.add(product);
    }
    return products;
  }

  Future<List<ProductModel>> getProductList() async {
    try {
      List<ProductModel> products = [];
      await _service
          .fetch("get", null,
              absoluteUrl: "$productsUrl?limit=10", needsCheckToken: true)
          .then((resp) {
        products = processProductList(resp.content);
        return products;
      });
      return products;
    } catch (e) {
      throw e;
    }
  }
}
