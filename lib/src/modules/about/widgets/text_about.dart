import 'package:flutter/material.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class TextAbout extends StatelessWidget {
  const TextAbout({
    super.key,
    required this.paragraph,
  });

  final String paragraph;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        style: PatinhaPerdidaTheme.titleSubDescription,
        textAlign: TextAlign.justify,
        paragraph,
      ),
    );
  }
}
