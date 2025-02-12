import 'package:flutter/material.dart';

import '../../../../core/theme/patinha_perdida_theme.dart';

class ContainerSelectionImage extends StatelessWidget {
  const ContainerSelectionImage({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  final IconData icon;
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, right: 24, left: 24),
        decoration: BoxDecoration(
          color: PatinhaPerdidaTheme.violetDropMenu,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                icon,
                color: PatinhaPerdidaTheme.violetDark,
              ),
              onPressed: onPressed,
              iconSize: 24,
            ),
            Text(
              title,
              style: PatinhaPerdidaTheme.titleSubDescription,
            ),
          ],
        ),
      ),
    );
  }
}
