import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/const_texts.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class PopUpPasswordReset extends StatelessWidget {
  const PopUpPasswordReset({
    super.key,
    required this.onPressed,
    required this.emailEC,
  });
  final TextEditingController? emailEC;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        PPTexts.resetPassword,
        style: PatinhaPerdidaTheme.titleAlertDialog,
        textAlign: TextAlign.center,
      ),
      content: Text(
        PPTexts.sendEmail,
        style: PatinhaPerdidaTheme.titleDescription,
        textAlign: TextAlign.justify,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Campo de email
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: emailEC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Informe seu email",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Enviar email"),
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
