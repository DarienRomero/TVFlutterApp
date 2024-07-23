import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class LoadingView extends StatelessWidget {
  final double heigth;
  const LoadingView({
    super.key,
    required this.heigth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mqHeigth(context, heigth),
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}