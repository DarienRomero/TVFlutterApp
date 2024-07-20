import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class HSpacing extends StatelessWidget {
  final double percentage;
  const HSpacing(this.percentage, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, percentage),
    );
  }
}