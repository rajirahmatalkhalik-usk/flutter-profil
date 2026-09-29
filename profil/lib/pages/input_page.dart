import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './output_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final npmController = TextEditingController();
  final jurusanController = TextEditingController();

  File? foto;
  final picker = ImagePicker();

  // Memilih foto dari galeri
  Future<void> pilihFoto() async {
    final XFile? hasil = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (hasil != null) {
      setState(() {
        foto = File(hasil.path);
      });
    }
  }

  // Menyimpan dan berpindah ke halaman output
  void simpanData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputPage(
          nama: namaController.text.trim(),
          npm: npmController.text.trim(),
          jurusan: jurusanController.text.trim(),
          foto: foto,
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    npmController.dispose();
    jurusanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Biodata'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Foto profil
              GestureDetector(
                onTap: pilihFoto,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.deepPurple.shade100,
                  backgroundImage:
                      foto != null ? FileImage(foto!) : null,
                  child: foto == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.deepPurple,
                        )
                      : null,
                ),
              ),

              const SizedBox(height: 10),

              TextButton.icon(
                onPressed: pilihFoto,
                icon: const Icon(Icons.photo_library),
                label: const Text('Pilih Foto Profil'),
              ),

              const SizedBox(height: 25),

              // Input nama
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Masukkan nama mahasiswa',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              // Input NPM
              TextFormField(
                controller: npmController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NPM',
                  hintText: 'Masukkan NPM',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NPM wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              // Input jurusan
              TextFormField(
                controller: jurusanController,
                decoration: const InputDecoration(
                  labelText: 'Jurusan',
                  hintText: 'Masukkan jurusan',
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jurusan wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Tombol SAVE
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: simpanData,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'SAVE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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