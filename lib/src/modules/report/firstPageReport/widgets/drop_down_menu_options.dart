import 'package:flutter/material.dart';

import '../../../../core/theme/patinha_perdida_theme.dart';

class DropDownMenuOptions extends StatelessWidget {
  const DropDownMenuOptions({
    Key? key,
    required this.hint,
    required this.value,
    required this.onChanged,
    required this.dropdownItems,
    required this.validator,
  }) : super(key: key);

  final dynamic value;
  final String? Function(String?)? onChanged;
  final String hint;
  final List<DropdownMenuItem<String>> dropdownItems;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: PatinhaPerdidaTheme.violetDropMenu,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      isExpanded: true,
      hint: Text(hint),
      value: value,
      onChanged: onChanged,
      items: dropdownItems,
      validator: validator,
    );
  }
}
