import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/AuthModule/models/auth_credential_model.dart';

import '../../../main_module.dart';
import 'auth_repository.dart';

class UserStore {
  final AuthRepository authRepository = Modular.get<AuthRepository>();

  bool _isLoggedIn = false;
  AuthCredentialModel? _currentUser;

  doLogin(String email, String password) async {
    try {
      final AuthCredentialModel _authCredentialModel =
          await authRepository.login(email, password);
      if (_authCredentialModel.token != null) {
        setIsLoggedIn(true);
        _currentUser = _authCredentialModel;
        Modular.to.navigate(Routes.products);
      }
    } catch (e) {
      throw e;
    }
  }

  bool get isLoggedIn => _isLoggedIn;
  AuthCredentialModel? get currentUser => _currentUser;
  void setIsLoggedIn(bool value) => _isLoggedIn = value;
}
