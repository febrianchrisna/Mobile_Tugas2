import 'package:flutter/material.dart';
import 'package:tugas2/pages/home/home.dart';
import 'package:tugas2/pages/main/consts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double num1 = 0;
  String operation = '';
  bool isOperationSelected = false;
  bool afterEquals = false;

  void _numberPressed(String number) {
    setState(() {
      if (afterEquals) {
        display = number;
        afterEquals = false;
      } else if (display == '0' || isOperationSelected) {
        display = number;
        isOperationSelected = false;
      } else {
        display += number;
      }
    });
  }

  void _decimalPressed() {
    setState(() {
      if (afterEquals) {
        display = '0.';
        afterEquals = false;
      } else if (isOperationSelected) {
        display = '0.';
        isOperationSelected = false;
      } else if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  void _operationPressed(String op) {
    if (operation.isNotEmpty) {
      _calculate();
    }
    setState(() {
      num1 = double.parse(display);
      operation = op;
      isOperationSelected = true;
      afterEquals = false;
    });
  }

  void _calculate() {
    double num2 = double.parse(display);
    double result = 0;

    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      default:
        return;
    }

    setState(() {
      display = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
      num1 = result;
      operation = '';
      afterEquals = true;
    });
  }

  void _clear() {
    setState(() {
      display = '0';
      num1 = 0;
      operation = '';
      isOperationSelected = false;
      afterEquals = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: g1,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [g1, g2],
          ),
        ),
        child: Column(
          children: [
            // Bagian display (1/2 layar atas)
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Text(
                  display,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Bagian tombol (1/2 layar bawah)
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800]?.withOpacity(0.5), // Menambahkan transparansi
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.1,
                  children: [
                    // Baris 2
                    _buildButton('7', () => _numberPressed('7')),
                    _buildButton('8', () => _numberPressed('8')),
                    _buildButton('9', () => _numberPressed('9')),
                    _buildButton('+', () => _operationPressed('+')),

                    // Baris 3
                    _buildButton('4', () => _numberPressed('4')),
                    _buildButton('5', () => _numberPressed('5')),
                    _buildButton('6', () => _numberPressed('6')),
                    _buildButton('-', () => _operationPressed('-')),

                    // Baris 4
                    _buildButton('1', () => _numberPressed('1')),
                    _buildButton('2', () => _numberPressed('2')),
                    _buildButton('3', () => _numberPressed('3')),
                    _buildButton('=', () => _calculate()),

                    // Baris 5
                    _buildButton('AC', _clear),
                    _buildButton('0', () => _numberPressed('0')),
                    _buildButton('.', _decimalPressed),
                    SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.8), // Mengubah warna tombol menjadi putih transparan
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 3, // Mengurangi elevasi untuk efek yang lebih halus
        ),
        child: Text(text),
      ),
    );
  }
}