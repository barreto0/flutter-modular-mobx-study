import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToCartDialog extends StatefulWidget {
  const AddToCartDialog({Key? key}) : super(key: key);

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar produto ao carrinho?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Modular.to.pop(false);
          },
          child: const Text(
            'Não',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            Modular.to.pop(true);
          },
          child: const Text(
            'Sim',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
