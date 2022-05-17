import 'package:flutter_modular/flutter_modular.dart';
import 'Core/Services/api_service.dart';
import 'Modules/AuthModule/inner/auth_module_config.dart';
import 'Modules/AuthModule/inner/auth_repository.dart';
import 'Modules/AuthModule/inner/user_store.dart';
import 'Modules/ProductsModule/inner/products_module.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => UserStore()),
        Bind.singleton((i) => ApiService(url: "https://reqres.in/api/")),
        Bind.singleton((i) => AuthRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Routes.main, module: AuthModule()),
        ModuleRoute(Routes.products, module: ProductsModule()),
      ];
}

class Routes {
  static const main = "/";
  static const products = "/products";
}
