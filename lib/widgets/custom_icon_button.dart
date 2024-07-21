import 'package:flutter/material.dart';
import 'package:tv_flutter_app/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final double size;
  final Function() onPressed;
  final Function()? onLongPress;
  final Widget icon;
  final double borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final double iconPer;
  final Color? splashColor;
  final bool heightRef;
  final double borderWidth;

  const CustomIconButton({
    super.key, 
    required this.size,
    required this.onPressed,
    this.onLongPress,
    required this.icon,
    this.borderRadius = 100,
    this.fillColor,
    this.borderColor,
    this.iconPer = 0.6,
    this.splashColor,
    this.heightRef = false,
    this.borderWidth = 1 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        minHeight: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        maxHeight: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        maxWidth: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth
        )
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        elevation: 0,
        fillColor: fillColor ?? Theme.of(context).cardColor,
        splashColor: splashColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: SizedBox(
          width: mqWidth(context, size * iconPer),
          child: icon
        )
      ),
    );
  }
}