import 'package:flutter/material.dart';

class HomeTopControls extends StatelessWidget {
  const HomeTopControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Text("Movies", style: TextStyle(
              color: Colors.white
            ),),
            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
          ],
        ),
        Row(
          children: [
            Text("Series", style: TextStyle(
              color: Colors.white
            ),),
            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
          ],
        ),
        Row(
          children: [
            Text("Cartoons", style: TextStyle(
              color: Colors.white
            ),),
            Icon(Icons.arrow_drop_down_rounded, color: Colors.white,)
          ],
        ),
      ],
    );
  }
}