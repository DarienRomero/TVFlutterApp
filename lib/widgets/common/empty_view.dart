import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class EmptyView extends StatelessWidget {
  final double heigth;
  const EmptyView({
    super.key,
    required this.heigth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mqHeigth(context, heigth),
      child: const Center(
        child: Text("Sin resultados")
      ),
    );
  }
}