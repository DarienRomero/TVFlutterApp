import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';
import 'package:tv_flutter_app/widgets/sidebar_icon.dart';
import 'package:tv_flutter_app/widgets/v_spacing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: mqWidth(context, 10),
            height: mqHeigth(context, 100),
            color: Colors.black,
            child: const Column(
              children: [
                VSpacing(3),
                SidebarIcon(focused: true),
              ],
            ),
          ),
          Container(
            width: mqWidth(context, 90),
            height: mqHeigth(context, 100),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}