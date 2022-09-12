import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController nombreCtrl = TextEditingController(text: 'Diego Balestra');
TextEditingController inicialesCtrl = TextEditingController(text: 'DB');

mostrarAjustes(BuildContext context, String titulo) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo, style: const TextStyle(fontSize: 20)),
        content: SizedBox(
          height: 191,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text('Nombre', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              TextField(
                controller: nombreCtrl,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 10),
              const Text('Iniciales', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              TextField(
                controller: inicialesCtrl,
                maxLength: 2,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            elevation: 5,
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          MaterialButton(
            elevation: 5,
            textColor: Colors.blue,
            child: const Text('Guardar'),
            onPressed: () {
              // print(nombreCtrl.text);
              // print(inicialesCtrl.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(titulo, style: const TextStyle(fontSize: 20)),
      content: Column(
        children: [
          const SizedBox(height: 15),
          const Text('Nombre', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: nombreCtrl,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 10),
          const Text('Iniciales', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: inicialesCtrl,
            maxLength: 2,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.characters,
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Cancelar'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Guardar'),
          onPressed: () {
            // print(nombreCtrl.text);
            // print(inicialesCtrl.text);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
