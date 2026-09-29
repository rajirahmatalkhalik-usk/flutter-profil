import 'dart:io';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  final String nama;
  final String npm;
  final String jurusan;
  final File? foto;

  const OutputPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.jurusan,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 55,
              ),

              const SizedBox(height: 10),

              const Text(
                'Data Berhasil Disimpan!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),

              // Kartu biodata
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Foto profil
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.deepPurple.shade100,
                        backgroundImage: foto != null
                            ? FileImage(foto!)
                            : null,
                        child: foto == null
                            ? const Icon(
                                Icons.person,
                                size: 65,
                                color: Colors.deepPurple,
                              )
                            : null,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        nama,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Divider(height: 30),

                      // Informasi NPM
                      ListTile(
                        leading: const Icon(
                          Icons.badge,
                          color: Colors.deepPurple,
                        ),
                        title: const Text('NPM'),
                        subtitle: Text(
                          npm,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // Informasi jurusan
                      ListTile(
                        leading: const Icon(
                          Icons.school,
                          color: Colors.deepPurple,
                        ),
                        title: const Text('Jurusan'),
                        subtitle: Text(
                          jurusan,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('KEMBALI / EDIT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
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