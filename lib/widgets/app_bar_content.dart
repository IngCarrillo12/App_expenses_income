import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
    final String title;
    final String subtitle;
  const AppBarContent({
    super.key,
    required this.title,
    required this.subtitle,
    });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24, shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.white, // Color y opacidad de la sombra
                  ),
                    ],
                    ),
                  
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 18, shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.white, // Color y opacidad de la sombra
                  ),
                    ],),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}