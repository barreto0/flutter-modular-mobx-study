import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'App/MainWidget.dart';
import 'main_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      ModularApp(module: MainModule(), child: MainWidget(), debugMode: false));
}
