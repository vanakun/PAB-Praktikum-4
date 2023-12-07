import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
              width: 190,
              height: 50,
              child: PinTextField(),
            ),
            SizedBox(height: 30),
            Container(
              width: 115,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add PIN validation logic here
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
  @override
  _PinTextFieldState createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _pinController,
      keyboardType: TextInputType.number,
      obscureText: true,
      maxLength: 2,
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

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
