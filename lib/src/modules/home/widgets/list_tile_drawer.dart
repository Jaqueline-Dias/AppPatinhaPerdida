import 'package:flutter/material.dart';

import '../../../core/theme/patinha_perdida_theme.dart';

class ListTileDrawer extends StatefulWidget {
  const ListTileDrawer({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  State<ListTileDrawer> createState() => _ListTileDrawerState();
}

class _ListTileDrawerState extends State<ListTileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: PatinhaPerdidaTheme.violetDark,
        ),
        title: Text(
          widget.title,
          style: PatinhaPerdidaTheme.titleDescription,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
