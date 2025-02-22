import 'package:flutter/material.dart';
import '../main/consts.dart';
import 'package:tugas2/pages/home/home.dart';

class HitungDigitPage extends StatefulWidget {
  const HitungDigitPage({super.key});

  @override
  HitungDigitScreen createState() => HitungDigitScreen();
}

class HitungDigitScreen extends State<HitungDigitPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';
  Color _resultColor = Colors.white; // Default color is white

  void hitungDigit() {
    final input = _numberController.text;
    int? number = int.tryParse(input);
    

    if (number == null) {
      setState(() {
        _result = 'Input tidak valid! Masukkan angka yang benar';
        _resultColor = Colors.red; // Set color to red for error
      });
      return;
    } else {
      int angka = number;
      setState(() {
      int total = 0;
      while (angka != 0) {
        total += angka % 10; // Ambil digit terakhir dan tambahkan ke sum
        angka ~/= 10; // Hapus digit terakhir
      }
      _result = total.toString();
      _resultColor =
          Colors.white; // Set color to white for Ganjil, blue for Genap
    });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
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
            colors: [
              g1,
              g2,
            ], // Pastikan g1 dan g2 didefinisikan dengan warna yang sesuai
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: kInputColor),
              decoration: InputDecoration(
                labelText: 'Masukkan bilangan',
                labelStyle: TextStyle(
                  color: Colors.white,
                ), // Mengubah warna label menjadi putih
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ), // Mengubah warna border menjadi putih
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ), // Border saat fokus
                ),
                suffixIcon: Icon(Icons.numbers),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Silakan masukkan angka';
                }
                if (int.tryParse(value) == null) {
                  return 'Masukkan angka yang valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungDigit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Hitung Bilangan'),
            ),
            const SizedBox(height: 30),
            Text(
              _result,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _resultColor, // Use the dynamic color for result
              ),
            ),
          ],
        ),
      ),
    );
  }
}
