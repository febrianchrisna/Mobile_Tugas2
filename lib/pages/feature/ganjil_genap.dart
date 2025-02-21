import 'package:flutter/material.dart';
import 'package:tugas2/pages/home/home.dart';
import 'package:tugas2/pages/main/consts.dart';

class NumberCheckScreen extends StatefulWidget {
  const NumberCheckScreen({super.key});

  @override
  State<NumberCheckScreen> createState() => _NumberCheckScreenState();
}

class _NumberCheckScreenState extends State<NumberCheckScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _result;
  Color _resultColor = Colors.white; // Default color is white

  void _checkNumber() {
    final input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _result = 'Masukkan bilangan terlebih dahulu!';
        _resultColor = Colors.red; // Set color to red for error
      });
      return;
    }

    final number = int.tryParse(input);
    if (number == null) {
      setState(() {
        _result = 'Input tidak valid!';
        _resultColor = Colors.red; // Set color to red for error
      });
      return;
    }

    setState(() {
      _result = number % 2 == 0 ? 'Genap' : 'Ganjil';
      _resultColor = Colors.white; // Set color to white for Ganjil, blue for Genap
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: kInputColor,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan bilangan',
                labelStyle: TextStyle(color: Colors.white), // Mengubah warna label menjadi putih
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2), // Border saat fokus
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _result = null;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumber,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Cek Bilangan'),
            ),
            const SizedBox(height: 30),
            if (_result != null)
              Text(
                _result!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _resultColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
