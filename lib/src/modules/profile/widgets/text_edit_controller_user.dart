import 'package:flutter/material.dart';
import 'package:patinha_app/src/core/constants/constants.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class TextEditControllerUser extends StatefulWidget {
  const TextEditControllerUser({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.icon,
    this.controller,
  });

  final String labelText;
  final String placeholder;
  final IconData icon;
  final TextEditingController? controller;

  @override
  State<TextEditControllerUser> createState() => _TextEditControllerUserState();
}

class _TextEditControllerUserState extends State<TextEditControllerUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: PPColors.white,
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          enabled: false,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: PatinhaPerdidaTheme.titleDescription,
        ),
      ),
    );
  }
}
