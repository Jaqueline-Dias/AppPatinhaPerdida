import 'package:flutter/material.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class PositionedProfile extends StatelessWidget {
  const PositionedProfile({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 4,
              color: Colors.white,
            ),
            color: PatinhaPerdidaTheme.violetDark,
          ),
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
