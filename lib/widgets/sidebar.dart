import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/sidebar_icon.dart';
import 'package:tv_flutter_app/widgets/v_spacing.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, 10),
      height: mqHeigth(context, 100),
      color: Colors.black,
      child: const Column(
        children: [
          VSpacing(3),
          SidebarIcon(
            focused: true,
            icon: Icons.menu
          ),
          VSpacing(4),
          SidebarIcon(
            focused: false,
            icon: Icons.home_filled
          ),
          VSpacing(2),
          SidebarIcon(
            focused: false,
            icon: Icons.favorite
          ),
          VSpacing(2),
          SidebarIcon(
            focused: false,
            icon: Icons.person
          ),
        ],
      ),
    );
  }
}