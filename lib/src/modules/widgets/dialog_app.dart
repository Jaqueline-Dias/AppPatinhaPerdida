import 'package:flutter/material.dart';

import '../../core/theme/patinha_perdida_theme.dart';

class DialogApp extends StatelessWidget {
  const DialogApp({
    super.key,
    required this.onPressed,
    required this.title,
    required this.description,
    required this.titleButton,
  });

  final String title;
  final String description;
  final String titleButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: PatinhaPerdidaTheme.titleAlertDialog,
        textAlign: TextAlign.center,
      ),
      content: Text(
        description,
        style: PatinhaPerdidaTheme.titleDescription,
        textAlign: TextAlign.justify,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              child: Text(titleButton),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancelar",
                style: PatinhaPerdidaTheme.subTitleSmallStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
