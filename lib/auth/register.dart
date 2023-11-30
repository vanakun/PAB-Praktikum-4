import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nbiController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/regis.png',
                    height: 140,
                  ),
                ],
              ),
              SizedBox(height: 1), // Reduce the height between the image and the text
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Praktikum PAB 2023',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 60),
              TextField(
                controller: _nbiController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukan Nama ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nbiController,
                decoration: InputDecoration(
                  labelText: 'Nbi',
                  hintText: 'Masukan Nbi ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _kelasController,
                decoration: InputDecoration(
                  labelText: 'Kelas Praktikum',
                  hintText: 'Masukan Praktikum ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  String nama = _namaController.text;
                  String nbi = _nbiController.text;
                  String kelasPraktikum = _kelasController.text;

                  print('Nama: $nama, NBI: $nbi, Kelas Praktikum: $kelasPraktikum');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
