import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  _AddTransactionPage createState() => _AddTransactionPage();
}

class _AddTransactionPage extends State<AddTransactionPage> {
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime? _selectedDate; 
  String _type = 'Ingreso'; 

  // Función para seleccionar la fecha con Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Función para validar los campos
  bool _validateFields() {
    if (_categoryController.text.isEmpty || _amountController.text.isEmpty || _selectedDate == null) {
      return false; 
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, 
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/1341279/pexels-photo-1341279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Add Gasto/Ingreso',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              centerTitle: true,
            ),
          ),
          Positioned(
            top: 100, 
            left: 16,
            right: 16,
            bottom: 0, 
            child: SingleChildScrollView( 
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                          'Add Form',
                          style: TextStyle(color: Colors.black, fontSize: 24,  fontWeight: FontWeight.bold),
                        ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _categoryController,
                      decoration: InputDecoration(
                        labelText: 'Ingresar categoría',
                        hintText: 'Electricidad',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                         floatingLabelStyle: const TextStyle(color: Colors.blue)

                          
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: 'Ingresar monto',
                        hintText: '200.00',
                        prefixText: '\$ ',
                        suffix: GestureDetector(
                          onTap: () {
                            _amountController.clear();
                          },
                          child: const Text('Clear',
                              style: TextStyle(color: Colors.blue, fontSize: 16)),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                         floatingLabelStyle: const TextStyle(color: Colors.blue)
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: _selectedDate != null
                            ? DateFormat('EEE, d MMM yyyy').format(_selectedDate!)
                            : 'Selecciona una fecha',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                         floatingLabelStyle: const TextStyle(color: Colors.blue)
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),

                    const SizedBox(height: 20),

                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _type,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Tipo',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      items: <String>['Ingreso', 'Gasto'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(
                                value == 'Ingreso' 
                                  ? Icons.arrow_circle_up_rounded 
                                  : Icons.arrow_circle_down_rounded,
                                color: value == 'Ingreso' ? Colors.green : Colors.red,
                              ),
                              const SizedBox(width: 10),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _type = newValue!;
                        });
                      },
                    ),

                    const SizedBox(height: 20),
                      Center(
                    child:  ElevatedButton(
                      
                      onPressed: () {
                        if (_validateFields()) {
                          final double amount = double.tryParse(_amountController.text) ?? 0.0;
                          final String category = _categoryController.text;
                          final String date = _selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                              : 'Sin fecha';
                          final String type = _type == 'Ingreso' ? 'Income' : 'Expenses';

                          Navigator.pop(context, {
                            'amount': amount,
                            'category': category,
                            'date': date,
                            'type': type,
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Por favor completa todos los campos.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        
                      ),
                      child: const Text('Agregar Transacción'),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
