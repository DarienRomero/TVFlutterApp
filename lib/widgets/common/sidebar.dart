import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/common/focusable_icon.dart';
import 'package:tv_flutter_app/widgets/common/v_spacing.dart';

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
          FocusableIcon(
            path: "assets/icons/menu-icon.svg",
            focused: false, 
          ),
          VSpacing(4),
          FocusableIcon(
            path: "assets/icons/home-icon.svg",
            focused: true, 
          ),
          VSpacing(2),
          FocusableIcon(
            path: "assets/icons/favorite-icon.svg",
            focused: false, 
          ),
          VSpacing(2),
          FocusableIcon(
            path: "assets/icons/profile-icon.svg",
            focused: false, 
          ),
        ],
      ),
    );
  }
}