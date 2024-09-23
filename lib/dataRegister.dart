import 'package:flutter/material.dart';

class Dataregister extends StatelessWidget {
  final String? nama,password,motoHidup, jenkel,pilihAgama;
  const Dataregister({this.nama, this.password,this.motoHidup,this.jenkel,this.pilihAgama, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Registrasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama Lengkap: $nama'),
            Text('Password: $password'),
            Text('Moto Hidup: $motoHidup'),
            Text('Jenis Kelamin: $jenkel'),
            Text('Agama: $pilihAgama'),

            MaterialButton(
              child: const Text('Back'),
                onPressed: () {
                Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
