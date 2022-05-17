import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/AuthModule/inner/auth_guard.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/inner/Stores/cart.store.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/pages/Cart/cart_screen.dart';
import 'package:flutter_modular_study/Modules/ProductsModule/pages/List/list_products_screen.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Cart()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => const ProductsList(), guards: [AuthGuard()]),
        ChildRoute('/cart',
            child: (_, args) => const CartScreen(), guards: [AuthGuard()]),
      ];
}
