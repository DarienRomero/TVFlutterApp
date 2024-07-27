import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tv_flutter_app/providers/button_focus_provider.dart';
import 'package:tv_flutter_app/widgets/common/button_detector_wrapper.dart';
import 'package:tv_flutter_app/widgets/common/custom_icon_button.dart';

class FocusableIcon extends StatelessWidget {
  final String path;
  final bool outlined;
  final double size;
  final double backgroundOpacity;
  final String label;
  final String? leftLabel;
  final String? rightLabel;
  final String? topLabel;
  final String? bottomLabel;
  final Function()? onLeftPressed;
  final Function()? onTopPressed;
  final Function()? onBottomPressed;
  final Function()? onRightPressed;
  final Function()? onEnterPressed;

  const FocusableIcon({
    super.key,
    required this.path,
    this.outlined = false,
    this.size = 4,
    this.backgroundOpacity = 0.3,
    this.label = "",
    this.leftLabel,
    this.rightLabel,
    this.topLabel,
    this.bottomLabel,
    this.onLeftPressed,
    this.onBottomPressed,
    this.onEnterPressed,
    this.onRightPressed,
    this.onTopPressed
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ButtonFocusProvider, String>(
      selector: (context, buttonFocusProvider) => buttonFocusProvider.buttonFocusedLabel,
      builder: (context, buttonFocusedLabel, _) {
        final focused = buttonFocusedLabel.contains(label);
        return ButtonDetectorWrapper(
          hasFocus: focused,
          onLeftPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(leftLabel != null){
              buttonFocusProvider.buttonFocusedLabel = leftLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
            if(onLeftPressed != null) onLeftPressed!();
          },
          onRightPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(rightLabel != null){
              buttonFocusProvider.buttonFocusedLabel = rightLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
            if(onRightPressed != null) onRightPressed!();
          },
          onTopPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(topLabel != null){
              buttonFocusProvider.buttonFocusedLabel = topLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
            if(onTopPressed != null) onTopPressed!();
          },
          onBottomPressed: (){
            final buttonFocusProvider = Provider.of<ButtonFocusProvider>(context, listen: false);
            if(bottomLabel != null){
              buttonFocusProvider.buttonFocusedLabel = bottomLabel!;
            }else{
              buttonFocusProvider.buttonFocusedLabel = "${label}_${buttonFocusProvider.getRandomNumber()}";
            }
            if(onBottomPressed != null) onBottomPressed!();
          },
          onEnterPressed: (){
            if(onEnterPressed != null) onEnterPressed!();
          },
          child: CustomIconButton(
            size: size,
            fillColor: focused ? Colors.white : Colors.black.withOpacity(backgroundOpacity),
            onPressed: (){
              if(onEnterPressed != null) onEnterPressed!();
            },
            iconPer: 0.4,
            borderColor: outlined ? Colors.white.withOpacity(focused ? 1.0 : 0.8)  : null,
            borderWidth: 1.0,
            borderRadius: outlined ? 5: 100,
            icon: SvgPicture.asset(
              path,
              color: focused ? Colors.black : Colors.white.withOpacity(0.8),
            )
          ),
        );
      },
    );
  }
}