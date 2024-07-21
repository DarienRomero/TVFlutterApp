import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route cupertinoNavigationRoute(BuildContext context, Widget page) {
  return CupertinoPageRoute(builder: (context) => page);
}
Route materialNavigationRoute(BuildContext context, Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}