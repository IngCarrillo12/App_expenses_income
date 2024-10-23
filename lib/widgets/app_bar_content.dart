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
                    offset: Offset(2.0, 4.0), 
                    blurRadius: 3.0,
                    color:  Colors.white, 
                  ),
                    ],
                    ),
                  
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 18, shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), 
                    blurRadius: 3.0,
                    color:  Colors.white,
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