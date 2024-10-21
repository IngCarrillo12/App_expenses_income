import 'package:flutter/material.dart';

class ExpenseIncomeItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final Color color;

  const ExpenseIncomeItem ({
        super.key, 
        required this.title, 
        required this.date, 
        required this.amount, 
        required this.color
        });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(title[0]),
      ),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, shadows: [
      Shadow(
        offset: const Offset(2.0, 2.0), // Desplazamiento de la sombra (x, y)
        blurRadius: 3.0, // Desenfoque de la sombra
        color: Colors.grey.withOpacity(0.5), // Color y opacidad de la sombra
      ),
    ],)),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}