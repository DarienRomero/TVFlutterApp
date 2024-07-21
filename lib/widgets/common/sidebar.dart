import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/labels.dart';
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
            label: sidebarMenuOption,
            bottomLabel: sidebarHomeOption,
            rightLabel: homePreviousMovie,
          ),
          VSpacing(4),
          FocusableIcon(
            path: "assets/icons/home-icon.svg",
            label: sidebarHomeOption,
            topLabel: sidebarMenuOption,
            bottomLabel: sidebarFavOption,
            rightLabel: homePreviousMovie,
          ),
          VSpacing(2),
          FocusableIcon(
            path: "assets/icons/favorite-icon.svg",
            label: sidebarFavOption,
            topLabel: sidebarHomeOption,
            bottomLabel: sidebarProfileOption,
            rightLabel: homePreviousMovie,
          ),
          VSpacing(2),
          FocusableIcon(
            path: "assets/icons/profile-icon.svg",
            label: sidebarProfileOption,
            topLabel: sidebarFavOption,
            rightLabel: homePreviousMovie,
          ),
        ],
      ),
    );
  }
}