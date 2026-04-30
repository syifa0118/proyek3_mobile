import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

class EditProfilePage extends StatefulWidget {
  final String nama;
  final String email;
  final String telp;
  final String alamat;
  final List<String> riwayat;

  const EditProfilePage({
    super.key,
    required this.nama,
    required this.email,
    required this.telp,
    required this.alamat,
    required this.riwayat,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  late TextEditingController namaC;
  late TextEditingController emailC;
  late TextEditingController telpC;
  late TextEditingController alamatC;
  late TextEditingController riwayatC;

  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    namaC = TextEditingController(text: widget.nama);
    emailC = TextEditingController(text: widget.email);
    telpC = TextEditingController(text: widget.telp);
    alamatC = TextEditingController(text: widget.alamat);

    /// 🔥 FIX: join lebih rapi
    riwayatC = TextEditingController(
      text: widget.riwayat.join(", "),
    );
  }

  /// 🔥 FIX: null safety + aman
  void pickImage() {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files?.first;
      if (file == null) return;

      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((event) {
        setState(() {
          _image = reader.result as Uint8List;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff48618F),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF2F4F7),
              borderRadius: BorderRadius.circular(30),
            ),

            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  /// HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// FOTO
                  Stack(
                    children: [

                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _image != null
                            ? MemoryImage(_image!)
                            : const AssetImage("assets/profile.jpg") as ImageProvider,
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// FORM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [

                        input(namaC, "Nama"),
                        input(emailC, "Email"),
                        input(telpC, "Telepon"),
                        input(alamatC, "Alamat"),

                        /// 🔥 RIWAYAT
                        input(riwayatC, "Riwayat (pisahkan dengan koma)"),

                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {

                            /// 🔥 FIX: bersihin spasi & kosong
                            List<String> hasilRiwayat = riwayatC.text
                                .split(",")
                                .map((e) => e.trim())
                                .where((e) => e.isNotEmpty)
                                .toList();

                            Navigator.pop(context, {
                              "nama": namaC.text,
                              "email": emailC.text,
                              "telp": telpC.text,
                              "alamat": alamatC.text,
                              "image": _image,
                              "riwayat": hasilRiwayat,
                            });
                          },
                          child: const Text("Simpan"),
                        ),

                        const SizedBox(height: 20),
                      ],
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

  Widget input(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
