import 'package:flutter/material.dart';

class IconButtonPatinhaPerdida extends StatelessWidget {
  const IconButtonPatinhaPerdida({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }
}
