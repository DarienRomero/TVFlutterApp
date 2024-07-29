import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
class ButtonDetectorWrapper extends StatefulWidget {
  final Widget child;
  final bool hasFocus;
  final Function()? onLeftPressed;
  final Function()? onRightPressed;
  final Function()? onTopPressed;
  final Function()? onBottomPressed;
  final Function()? onEnterPressed;

  ButtonDetectorWrapper({
    required this.child, 
    required this.hasFocus,
    this.onLeftPressed, 
    this.onRightPressed, 
    this.onTopPressed, 
    this.onBottomPressed, 
    this.onEnterPressed, 
  });

  @override
  _ButtonDetectorWrapperState createState() => _ButtonDetectorWrapperState();
}

class _ButtonDetectorWrapperState extends State<ButtonDetectorWrapper> {
  final FocusNode _focusNode = FocusNode();
  bool sending = false;

  @override
  Widget build(BuildContext context) {
    if (widget.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
    if (!widget.hasFocus) {
      _focusNode.unfocus();
    }
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (!widget.hasFocus) return;
        if (event is KeyDownEvent) {
          final int keyPressed = event.logicalKey.keyId;
          print("keyPressed");
          print(keyPressed);
          if (keyPressed == 4294968065) {
            widget.onBottomPressed?.call();
          } else if (keyPressed == 4294968068) {
            widget.onTopPressed?.call();
          } else if (keyPressed == 4294968066) {
            widget.onLeftPressed?.call();
          } else if (keyPressed == 4294968067) {
            widget.onRightPressed?.call();
          } else if (keyPressed == 4294968588 || keyPressed == 4294967309) {
            widget.onEnterPressed?.call();
          }
        }
      },
      child: widget.child,
    );
  }
}