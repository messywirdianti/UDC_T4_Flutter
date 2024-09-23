import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task4_flutter/dataRegister.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController motoHidup = TextEditingController();
  String? jenkel, pilihAgama;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register Task",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.green,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: keyForm,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'REGISTER',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 35),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Nama tidak boleh kosong" : null;
                    },
                    controller: nama,
                    decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ))),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty
                          ? "Password tidak boleh kosong"
                          : null;
                    },
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ))),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty
                          ? "Moto Hidup tidak boleh kosong"
                          : null;
                    },
                    controller: motoHidup,
                    decoration: InputDecoration(
                        hintText: 'Moto Hidup',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ))),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      RadioListTile(
                        title: const Text('Laki-Laki'),
                        activeColor: Colors.blueAccent,
                        value: 'Laki-Laki',
                        groupValue: jenkel,
                        onChanged: (val) {
                          setState(() {
                            jenkel = val;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Perempuan'),
                        activeColor: Colors.blueAccent,
                        value: 'Perempuan',
                        groupValue: jenkel,
                        onChanged: (val) {
                          setState(() {
                            jenkel = val;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  DropdownButton(
                    isExpanded: true,
                    hint: const Text('Pilih Agama'),
                    value: pilihAgama,
                    items: [
                      "Islam",
                      "Kristen",
                      "Budha",
                      "Hindu",
                    ].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        pilihAgama = val;
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Data Register'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Nama Lengkap: ${nama.text}'),
                                Text('Password: ${password.text}'),
                                Text('Moto Hidup: ${motoHidup.text}'),
                                Text('Jenis Kelamin: $jenkel'),
                                Text('Agama: $pilihAgama'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Dataregister(
                                        nama: nama.text,
                                        password: password.text,
                                        motoHidup: motoHidup.text,
                                        jenkel: jenkel,
                                        pilihAgama: pilihAgama,
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Ok'),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna tombol
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Padding
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks tombol
                    ),
                  ),
                )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
