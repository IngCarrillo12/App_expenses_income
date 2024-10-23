import 'package:flutter/material.dart';

class ExpenseIncomeItem extends StatefulWidget {
  final String title;
  final String date;
  final String amount;
  final Color color;

  const ExpenseIncomeItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.color,
  });

  @override
  _ExpenseIncomeItemState createState() => _ExpenseIncomeItemState();
}

class _ExpenseIncomeItemState extends State<ExpenseIncomeItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeInOut, 
        decoration: BoxDecoration(
          color: _isHovered ? Colors.grey[100] : Colors.white, 
          border: Border.all(
            color: widget.color,
            width: _isHovered ? 3.0 : 2.0, 
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [const BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))]
              : [],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: widget.color,
            child: Text(widget.title[0]),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
          ),
          subtitle: Text(widget.date),
          trailing: Text(
            widget.amount,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
