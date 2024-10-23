import 'package:app_ingresos_gastos/pages/AddTransaction.dart';
import 'package:app_ingresos_gastos/widgets/app_bar_content.dart';
import 'package:app_ingresos_gastos/widgets/balance_card.dart';
import 'package:app_ingresos_gastos/widgets/expense_income_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double expenses = 0;
  double income = 0;
  double tbalance = 0;
  
  String? _hoveredKey;  // Variable para controlar qué item está en hover


  final Map<String, Map<String, dynamic>> transactions = {
    '1': {
      'category': 'Electricidad',
      'date': '2024-10-16',
      'amount': 100.00,
      'type': 'Expenses'
    },
    '2': {
      'category': 'Transferencia',
      'date': '2024-10-16',
      'amount': 200.00,
      'type': 'Income'
    },
  };

  @override
  void initState() {
    super.initState();
    _calculatedExpensesIncome();
    _calculatedBalance();
  }

  void _calculatedExpensesIncome() {
    expenses = 0;
    income = 0;

    transactions.forEach((key, item) {
      double amount = item['amount'] as double;
      if (item['type'] == 'Income') {
        income += amount;
      } else if (item['type'] == 'Expenses') {
        expenses += amount;
      }
    });
  }

  void _calculatedBalance() {
    setState(() {
      tbalance = income - expenses;
    });
  }

  void _addNewTransaction(Map<String, dynamic> transaction) {
    final String? category = transaction['category'] as String?;
    final String? date = transaction['date'] as String?;
    final double? amount = transaction['amount'] as double?;
    final String? type = transaction['type'] as String?;

    if (category != null && date != null && amount != null && type != null) {
      setState(() {
        final newKey = (transactions.length + 1).toString(); 
        transactions[newKey] = {
          'category': category,
          'date': date,
          'amount': amount,
          'type': type
        };
        if (type == 'Income') {
          income += amount;
        } else if (type == 'Expenses') {
          expenses += amount;
        }
        _calculatedBalance(); 
      });
    } 
  }

  void _deleteTransaction(String key) {
    setState(() {
      transactions.remove(key);
      _calculatedExpensesIncome();
      _calculatedBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F2F6),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1341279/pexels-photo-1341279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
            ),
            child: const AppBarContent(title: 'Good afternoon,', subtitle: 'Hello Juan'),
          ),
          Positioned(
            top: 130,
            left: 16,
            right: 16,
            child: BalanceCard(
              expenses: expenses,
              balance: tbalance,
              income: income,
            ),
          ),

          Padding(
  padding: const EdgeInsets.only(top: 450),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16), 
        child: Text(
          'Transactions List', 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 37, 37, 37),
             shadows: [
                  Shadow(
                    offset: Offset(2.0, 4.0), 
                    blurRadius: 3.0, 
                    color:  Color.fromARGB(141, 17, 17, 17), 
                  ),
                    ], 
          ),
        ),
      ),
      const SizedBox(height: 10),
      Expanded( 
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final key = transactions.keys.elementAt(index);
            final transaction = transactions[key];

            if (transaction != null && transaction['category'] != null && transaction['date'] != null && transaction['amount'] != null && transaction['type'] != null) {
              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hoveredKey = key; 
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hoveredKey = null;  
                  });
                },
                child: Stack(
                  children: [
                    ExpenseIncomeItem(
                      title: transaction['category'],
                      date: transaction['date'],
                      amount: (transaction['type'] == 'Income'
                          ? '+ \$${transaction['amount']}'
                          : '- \$${transaction['amount']}'),
                      color: transaction['type'] == 'Income'
                          ? Colors.green
                          : Colors.red,
                    ),
                    if (_hoveredKey == key)
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(244, 244, 67, 54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              _deleteTransaction(key);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80.0)
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink(); 
            }
          },
        ),
      ),
    ],
  ),
),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTransaction = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTransactionPage(),
            ),
          );

          if (newTransaction != null) {
            _addNewTransaction({
              'category': newTransaction['category'],
              'date': newTransaction['date'],
              'amount': newTransaction['amount'],
              'type': newTransaction['type'],
            });
          }
        },
        backgroundColor: Colors.green ,
        child: const Icon(Icons.add),
      ),
    );
  }
}
