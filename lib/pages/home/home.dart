import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas2/pages/feature//kalkulator.dart';
import 'package:tugas2/pages/feature/ganjil_genap.dart';
import 'package:tugas2/pages/feature/kelompok.dart';
import 'package:tugas2/pages/main/consts.dart'; // Pastikan g1 dan g2 terdefinisi di sini
import 'package:tugas2/pages/login/login.dart'; // Pastikan halaman LoginPage diimport

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: g1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Tombol kembali
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [g1, g2],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.03),
            child: Column(
              children: [
                Image.asset(image1),
                SizedBox(height: size.height * 0.05),
                Text(
                  'Please, Select a Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                // Menu Buttons with CupertinoButton, Gradient, and White Border
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TeamPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [g1, g2], // Gradient using g1 and g2
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(37),
                      border: Border.all(color: Colors.white, width: 2), // White border
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Data Kelompok',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CalculatorScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [g1, g2], // Gradient using g1 and g2
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(37),
                      border: Border.all(color: Colors.white, width: 2), // White border
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_box, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Penjumlahan & Pengurangan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NumberCheckScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [g1, g2], // Gradient using g1 and g2
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(37),
                      border: Border.all(color: Colors.white, width: 2), // White border
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.casino, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Ganjil / Genap',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // Handle navigation or functionality here
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [g1, g2], // Gradient using g1 and g2
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(37),
                      border: Border.all(color: Colors.white, width: 2), // White border
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Jumlah Total Angka',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
