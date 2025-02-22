import 'package:flutter/material.dart';
import 'package:tugas2/pages/home/home.dart';
import 'package:tugas2/pages/main/consts.dart';

class DigitCalculator extends StatefulWidget {
  const DigitCalculator({super.key});

  @override
  State<DigitCalculator> createState() => _DigitCalculatorState();
}

class _DigitCalculatorState extends State<DigitCalculator> {
  final TextEditingController _controller = TextEditingController();
  int? _digitCount;
  int? _totalSum;
  String? _errorMessage;

  void _calculate() {
    final input = _controller.text;
    // Validasi input kosong
    if (input.isEmpty) {
      setState(() {
        _errorMessage = 'Masukkan angka terlebih dahulu';
        _digitCount = null;
        _totalSum = null;
      });
      return;
    }
    // Validasi input harus angka
    if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      setState(() {
        _errorMessage = 'Input harus berupa angka (0-9)';
        _digitCount = null;
        _totalSum = null;
      });
      return;
    }
    // Hitung jumlah digit dan total
    setState(() {
      _errorMessage = null;
      _digitCount = input.length;
      _totalSum = input
          .split('')
          .map((char) => int.parse(char))
          .reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: g1, // You can customize the AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [g1, g2], // g1 and g2 color
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: kInputColor),
              decoration: InputDecoration(
                labelText: 'Masukkan angka',
                labelStyle: TextStyle(color: Colors.white), // Mengubah warna label menjadi putih
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2), // Border saat fokus
                ),
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Hitung Digit'),
              ),
            ),
            const SizedBox(height: 30),
            if (_digitCount != null && _totalSum != null)
              Column(
                children: [
                  Text(
                    'Jumlah Digit: $_digitCount',
                    style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total Jumlah: $_totalSum',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
