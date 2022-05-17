import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/AuthModule/inner/redirect_guard.dart';
import 'package:flutter_modular_study/Modules/AuthModule/pages/Login/login_screen.dart';
import 'package:flutter_modular_study/Modules/AuthModule/pages/Register/register_screen.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.home,
            child: (_, args) => const LoginScreen(), guards: [RedirectGuard()]),
        ChildRoute(
          AppRoutes.auth,
          child: (_, args) => const LoginScreen(),
        ),
        ChildRoute(AppRoutes.register,
            child: (_, args) => const RegisterScreen()),
      ];
}

class AppRoutes {
  static const home = "/";
  static const auth = "/auth";
  static const register = "/auth/register";
}
