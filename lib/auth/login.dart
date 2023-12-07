import 'package:flutter/material.dart';
import 'package:praktikum_3/pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(75.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter Your PIN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Please enter your PIN that you have created',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              'assets/key.png',
              width: 150,
              height: 120,
            ),
            SizedBox(height: 8),
            Container(
              width: 2300,
              height: 50,
              child: PinTextField(controller: _pinController),
            ),
            SizedBox(height: 30),
            Container(
              width: 115,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi PIN
                  String enteredPin = _pinController.text;
                  if (enteredPin == 'Daskom8') {
                    // Jika PIN sesuai, pindah ke halaman beranda (contoh: HomeScreen)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    // Jika PIN tidak sesuai, tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('PIN salah. Coba lagi.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/key_open.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PinTextField extends StatefulWidget {
  final TextEditingController controller;

  PinTextField({required this.controller});

  @override
  _PinTextFieldState createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text, // Mengubah tipe keyboard
      obscureText: true,
      maxLength: 10,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: 'Enter PIN',
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
