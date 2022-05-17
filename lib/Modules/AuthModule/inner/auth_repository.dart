import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Core/Services/api_service.dart';
import 'package:flutter_modular_study/Modules/AuthModule/models/auth_credential_model.dart';
import 'package:flutter_modular_study/Modules/AuthModule/models/auth_register_response_model.dart';

class AuthRepository {
  final ApiService _service = Modular.get<ApiService>();
  final String authUrl = "https://reqres.in/api";

  Future<AuthCredentialModel> login(String email, String password) async {
    try {
      AuthCredentialModel authCredentialModel =
          await authUserAndGetToken(email, password);
      return authCredentialModel;
    } catch (e) {
      throw e;
    }
  }

  Future<AuthCredentialModel> authUserAndGetToken(
      String email, String password) async {
    return await _service
        .fetch("post", null,
            absoluteUrl: "$authUrl/login",
            body: {
              "email": email,
              "password": password,
            },
            needsCheckToken: false)
        .then((resp) {
      AuthCredentialModel res = AuthCredentialModel.fromJson(resp.content);
      return res;
    });
  }

  Future<AuthRegisterResponseModel> registerUser(
      String email, String password) async {
    return await _service
        .fetch("post", null,
            absoluteUrl: "$authUrl/register",
            body: {
              "email": email,
              "password": password,
            },
            needsCheckToken: false)
        .then((resp) {
      AuthRegisterResponseModel res =
          AuthRegisterResponseModel.fromJson(resp.content);
      return res;
    });
  }
}
