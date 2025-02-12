import 'package:flutter/material.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class ContainerRegister extends StatelessWidget {
  const ContainerRegister({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: PatinhaPerdidaTheme.violetFillligth,
          ),
        ),
        child: child,
      ),
    );
  }
}
