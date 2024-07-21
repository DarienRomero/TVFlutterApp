import 'package:flutter/material.dart';

class SidebarIcon extends StatelessWidget {
  final bool focused;
  final IconData icon;
  const SidebarIcon({
    super.key,
    required this.focused,
    required this.icon,
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
      icon: Icon(icon, color: focused ? Colors.black : Colors.white.withOpacity(0.6) ,)
    );
  }
}