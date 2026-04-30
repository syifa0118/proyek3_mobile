import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String nama = "Your name";
  String email = "example@gmail.com";
  String telp = "+6546-098-098";
  String alamat = "Jl. mawar lentera";

  List<String> riwayat = []; // 🔥 tetap list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff48618F),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),

            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 15),

                  /// BACK
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Kembali"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// CARD
                  Padding(
                    padding: const EdgeInsets.all(15),

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(blurRadius: 6, color: Colors.black12)
                        ],
                      ),

                      child: Column(
                        children: [

                          /// HEADER
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xffB9C3D4),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),

                            child: Column(
                              children: [

                                const Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1E3A6F),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Stack(
                                  children: [

                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage('assets/profile.jpg'),
                                    ),

                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          final result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => EditProfilePage(
                                                nama: nama,
                                                email: email,
                                                telp: telp,
                                                alamat: alamat,
                                                riwayat: riwayat,
                                              ),
                                            ),
                                          );

                                          /// 🔥 FIX NULL + TYPE
                                          if (result != null && result is Map) {
                                            setState(() {
                                              nama = result['nama'] ?? nama;
                                              email = result['email'] ?? email;
                                              telp = result['telp'] ?? telp;
                                              alamat = result['alamat'] ?? alamat;

                                              if (result['riwayat'] != null) {
                                                riwayat = List<String>.from(result['riwayat']);
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.edit, size: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const SizedBox(height: 10),

                                Center(
                                  child: Text(
                                    nama,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E3A6F),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                infoField(Icons.email, email),
                                infoField(Icons.phone, telp),
                                infoField(Icons.location_on, alamat),

                                const SizedBox(height: 10),

                                /// 🔥 RIWAYAT (SESUAI GAMBAR: TANPA JUDUL)
                                riwayat.isEmpty
                                    ? infoField(Icons.bathtub, "Riwayat tidak ada")
                                    : Column(
                                        children: riwayat
                                            .map((item) => infoField(Icons.bathtub, item))
                                            .toList(),
                                      ),
                              ],
                            ),
                          )
                        ],
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

  Widget infoField(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueGrey.shade200),
        ),

        child: Row(
          children: [
            Icon(icon, color: const Color(0xff1E3A6F)),
            const SizedBox(width: 10),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
