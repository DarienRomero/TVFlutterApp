import 'package:flutter/material.dart';

class SidebarIcon extends StatelessWidget {
  final bool focused;
  const SidebarIcon({
    super.key,
    required this.focused
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if(focused){
            return Colors.white;
          }else{
            return const Color(0x00000000);
          }
        }),
      ),
      onPressed: (){
        print("Clicked");
      }, 
      icon: Icon(Icons.home_filled, color: focused ? Colors.black : Colors.white.withOpacity(0.6) ,)
    );
  }
}