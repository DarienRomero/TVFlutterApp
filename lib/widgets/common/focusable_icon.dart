import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tv_flutter_app/widgets/common/custom_icon_button.dart';

class FocusableIcon extends StatelessWidget {
  final bool focused;
  final String path;
  final bool outlined;
  final double size;
  final double backgroundOpacity;

  const FocusableIcon({
    super.key,
    required this.focused,
    required this.path,
    this.outlined = false,
    this.size = 4,
    this.backgroundOpacity = 0.3
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      size: size,
      fillColor: focused ? Colors.white : Colors.black.withOpacity(backgroundOpacity),
      onPressed: (){}, 
      iconPer: 0.4,
      borderColor: outlined ? Colors.white.withOpacity(focused ? 1.0 : 0.8)  : null,
      borderWidth: 1.0,
      borderRadius: outlined ? 5: 100,
      icon: SvgPicture.asset(
        path,
        color: focused ? Colors.black : Colors.white.withOpacity(0.8),
      )
    );
  }
}