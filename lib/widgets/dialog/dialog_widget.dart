import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static questionStarDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Error...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text('Debe iniciar sesion para comenzar')
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: const Text("Confirmar"))],
    );
  }
}
