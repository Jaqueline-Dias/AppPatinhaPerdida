import 'package:flutter/material.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class Developers extends StatelessWidget {
  const Developers({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: PatinhaPerdidaTheme.violetLigth,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: Column(
          children: [
            Icon(
              icon,
              color: PatinhaPerdidaTheme.violetLigth,
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
