import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class VSpacing extends StatelessWidget {
  final double percentage;
  const VSpacing(this.percentage, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeigth(context, percentage),
    );
  }
}