import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas2/pages/home/home.dart';
import 'package:tugas2/pages/main/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true; // Untuk menyembunyikan atau menampilkan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = ''; // Untuk menampilkan pesan error jika login gagal

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                SizedBox(height: size.height * 0.1),
                Image.asset(image1),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: kWhiteColor.withOpacity(0.8),
                  ),
                ),
                const Text(
                  "Please, Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(height: size.height * 0.024),
                // Username TextField
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: kInputColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 22),
                    filled: true,
                    hintText: "Email or Phone",
                    hintStyle: TextStyle(color: kGrayColor),
                    prefixIcon: IconButton(onPressed: (){}, icon: Image.asset(userIcon)),
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2), // Border saat fokus
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.024),
                // Password TextField
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _obscurePassword, // Menyembunyikan atau menampilkan password
                  style: TextStyle(
                    color: kInputColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 22),
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(color: kGrayColor),
                    prefixIcon: IconButton(onPressed: (){}, icon: Image.asset(passwordIcon)),
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2), // Border saat fokus
                      borderRadius: BorderRadius.circular(37),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword; // Toggle antara menyembunyikan atau menampilkan password
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.024),
                // Error Message
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [kButtonColor1, kButtonColor2]),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Validasi input
                    if (username.isEmpty || password.isEmpty) {
                      setState(() {
                        errorMessage = 'Both fields are required!';
                      });
                    } else if (username == 'ifkeren' && password == 'if2022') {
                      // Login sukses
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      // Jika username atau password salah
                      setState(() {
                        errorMessage = 'Invalid username or password';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
