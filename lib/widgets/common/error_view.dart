import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class ErrorView extends StatelessWidget {
  final double heigth;
  const ErrorView({
    super.key,
    required this.heigth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mqHeigth(context, heigth),
      child: const Center(
        child: Text("Ocurrió un error")
      ),
    );
  }
}