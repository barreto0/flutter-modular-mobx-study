import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_study/Modules/AuthModule/inner/user_store.dart';
import 'login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final UserStore _userStore = Modular.get<UserStore>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode senhaFocusNode = FocusNode();

  bool isPasswordVisible = false;
  bool showModalMessage = false;
  bool showErrorStatus = false;

  final formKey = GlobalKey<FormState>();

  String removeWhiteSpacesFromString(String stringToRemove) {
    return stringToRemove.replaceAll(' ', '');
  }

  @override
  void initState() {
    super.initState();
  }

  goToRegisterPage() {
    Modular.to.navigate("/auth/register");
  }

  Future doLogin() async {
    try {
      await _userStore
          .doLogin(emailController.text, senhaController.text)
          .then((value) {
        Modular.to.navigate("/products");
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong password provided for that user.'),
        ),
      );
    }
  }
}
