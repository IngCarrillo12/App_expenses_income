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
  bool _isHidden = false;
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
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeInOut,
        child: Transform.scale(
          scale: _isHovered ? 1.01 : 1.0, 
          child: Container(
            width: double.infinity,
            height: 280,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/952670/pexels-photo-952670.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: _isHovered
                      ? const Offset(7, 25)
                      : const Offset(5, 20), 
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
                                offset: Offset(2.0, 4.0),
                                blurRadius: 3.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Credit Card",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 4.0),
                                blurRadius: 3.0,
                                color: Colors.white,
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
                            Icon(Icons.account_balance_outlined,
                                color: Colors.grey),
                            Text(
                              " Total Balance",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 4.0),
                                    blurRadius: 3.0,
                                    color: Colors.grey,
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
                            Icon(Icons.arrow_circle_up_rounded,
                                color: Colors.green),
                            Text(
                              " Income",
                              style: TextStyle(
                                color: Colors.white70,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 4.0),
                                    blurRadius: 3.0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _isHidden ? '****' : '\$ + ${widget.income}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.arrow_circle_down_rounded,
                                color: Colors.red),
                            Text(
                              " Expenses",
                              style: TextStyle(
                                color: Colors.white70,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 4.0) ,
                                    blurRadius: 3.0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
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
          ),
        ),
      ),
    );
  }
}
