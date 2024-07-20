import 'package:flutter/material.dart';

double mqHeigth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.height * (percentage/100);
}
double mqWidth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.width * (percentage/100);
}