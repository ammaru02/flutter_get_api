import 'package:flutter/material.dart';

void showAlert(BuildContext context,
    {void Function()? onpressedno, void Function()? onpressedok,}) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: const Text('Yakin ingin menghapus data ini?'),
      actions: [
        TextButton(
          onPressed: onpressedno,
          child: const Text(
            "no",
          ),
        ),
        TextButton(
          onPressed: onpressedok,
          child: const Text(
            'OK',
          ),
        )
      ],
    );
  },);
}
