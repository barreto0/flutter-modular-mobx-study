import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/AuthModule/inner/user_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth');

  final userStore = Modular.get<UserStore>();

  @override
  bool canActivate(String path, ModularRoute router) {
    return Modular.get<UserStore>().isLoggedIn;
  }
}
