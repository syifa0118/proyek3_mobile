import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

class EditProfilePage extends StatefulWidget {
  final String nama;
  final String email;
  final String telp;
  final String alamat;

  const EditProfilePage({
    super.key,
    required this.nama,
    required this.email,
    required this.telp,
    required this.alamat,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  late TextEditingController namaC;
  late TextEditingController emailC;
  late TextEditingController telpC;
  late TextEditingController alamatC;

  Uint8List? _image; // 🔥 simpan foto

  @override
  void initState() {
    super.initState();
    namaC = TextEditingController(text: widget.nama);
    emailC = TextEditingController(text: widget.email);
    telpC = TextEditingController(text: widget.telp);
    alamatC = TextEditingController(text: widget.alamat);
  }

  /// 🔥 PILIH FOTO (WEB)
  void pickImage() {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Color(0xff1E3A6F),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1E3A6F),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// 🔥 FOTO PROFILE (SUDAH BISA GANTI)
                  Stack(
                    alignment: Alignment.center,
                    children: [

                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                      ),

                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _image != null
                            ? MemoryImage(_image!)
                            : const AssetImage("assets/profile.jpg") as ImageProvider,
                      ),

                      /// 🔥 ICON CAMERA (SUDAH BISA DIKLIK)
                      Positioned(
                        bottom: 0,
                        right: 5,
                        child: GestureDetector(
                          onTap: pickImage, // 🔥 INI YANG PENTING
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xffB9C3D4),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// FORM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        label("Nama Lengkap"),
                        inputField(namaC, "Nama Lengkap"),

                        label("Email"),
                        inputField(emailC, "Email"),

                        label("Nomor Telepon"),
                        inputField(telpC, "Nomor telepon"),

                        label("Alamat"),
                        inputField(alamatC, "Alamat"),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff162D5C),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, {
                                "nama": namaC.text,
                                "email": emailC.text,
                                "telp": telpC.text,
                                "alamat": alamatC.text,
                                "image": _image,
                              });
                            },
                            child: const Text("Simpan"),
                          ),
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

  Widget label(String text){
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xff1E3A6F),
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hint){
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xffE6EAF0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
