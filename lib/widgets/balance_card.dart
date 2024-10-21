import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  final double balance;
  final double expenses;
  final double income;

  const BalanceCard({
    super.key,
    required this.expenses,
    required this.balance,
    required this.income,
  });

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  // Variable para controlar la visibilidad
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/fondocard.webp'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        spreadRadius: 5, 
        blurRadius: 7, 
        offset: const Offset(5, 20), // Desplazamiento de la sombra (x, y)
      ),
    ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Visa",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold, 
                        shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.white, // Color y opacidad de la sombra
                  ),
                    ],),
                  ),
                  Text(
                    "Credit Card",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.white, // Color y opacidad de la sombra
                  ),
                    ],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  'https://img.icons8.com/office/60/sim-card-chip.png'),
              const Text(
                "  **** **** ***** 5786",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.account_balance_outlined, color: Colors.grey),
                      Text(
                        " Total Balance",
                        style: TextStyle(color: Colors.white70, fontSize: 16, shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.grey, // Color y opacidad de la sombra
                  ),
                    ],
                    ),
                      ),
                    ],
                  ),
                  Text(
                    _isHidden ? '****' : '\$ ${widget.balance}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                        ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.arrow_circle_up_rounded, color: Colors.green),
                      Text(" Income", style: TextStyle(color: Colors.white70,
                       shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.grey, // Color y opacidad de la sombra
                  ),
                    ],
                      )),
                    ],
                  ),
                  Text(
                    _isHidden ? '****' : '\$ + ${widget.income}',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.arrow_circle_down_rounded, color: Colors.red),
                      Text(" Expenses",
                          style: TextStyle(color: Colors.white70,
                           shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), // Desplazamiento de la sombra (x, y)
                    blurRadius: 3.0, // Desenfoque de la sombra
                    color:  Colors.grey, // Color y opacidad de la sombra
                  ),
                    ],
                          )),
                    ],
                  ),
                  Text(
                    _isHidden ? '****' : '\$ - ${widget.expenses}',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
