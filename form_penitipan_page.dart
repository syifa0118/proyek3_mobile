import 'package:flutter/material.dart';

class FormPenitipanPage extends StatefulWidget {
  const FormPenitipanPage({super.key});

  @override
  State<FormPenitipanPage> createState() => _FormPenitipanPageState();
}

class _FormPenitipanPageState extends State<FormPenitipanPage> {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController hewanController = TextEditingController();
  final TextEditingController tasController = TextEditingController();

  String? jenisPenitipan;
  String? ukuranHewan;
  String? metodePembayaran;

  DateTime? selectedDate;

  Future<void> pilihTanggal() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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

                  /// BACK BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Kembali"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// CARD FORM
                  Padding(
                    padding: const EdgeInsets.all(15),

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.black12,
                          )
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              children: const [
                                Center(
                                  child: Text(
                                    "Form Penitipan",
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E3A6F),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "Isi formulir di bawah ini untuk layanan\n"
                                  "penitipan hewan peliharaan Anda",
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                label("Nama Pemilik"),
                                inputField(namaController, "Masukkan nama lengkap"),

                                label("Nomor Telepon"),
                                inputField(telpController, "Contoh: 09876543"),

                                label("Jenis Penitipan"),
                                dropdown(
                                  hint: "Pilih jenis penitipan",
                                  value: jenisPenitipan,
                                  items: ["Basic", "Complete", "Premium"],
                                  onChanged: (val){
                                    setState(() {
                                      jenisPenitipan = val;
                                    });
                                  },
                                ),

                                label("Ukuran Hewan"),
                                dropdown(
                                  hint: "Pilih ukuran hewan",
                                  value: ukuranHewan,
                                  items: ["Kecil", "Sedang", "Besar"],
                                  onChanged: (val){
                                    setState(() {
                                      ukuranHewan = val;
                                    });
                                  },
                                ),

                                label("Tanggal"),

                                GestureDetector(
                                  onTap: pilihTanggal,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 18,
                                    ),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey),
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                          selectedDate == null
                                              ? "dd/mm/yyyy"
                                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                        ),

                                        const Icon(Icons.calendar_today)
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                label("Nama dan warna Hewan"),
                                inputField(hewanController, "Contoh: Mochi - coklat"),

                                label("Warna Pet Cargo/Tas"),
                                inputField(tasController, "Masukkan warna pet cargo/tas"),

                                label("Metode Pembayaran"),
                                dropdown(
                                  hint: "Pilih Metode Pembayaran",
                                  value: metodePembayaran,
                                  items: ["Cash", "Transfer", "E-Wallet"],
                                  onChanged: (val){
                                    setState(() {
                                      metodePembayaran = val;
                                    });
                                  },
                                ),

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

                                    onPressed: () {},

                                    child: const Text(
                                      "Kirim",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
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

  Widget label(String text){
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff1E3A6F),
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hint){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget dropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }){

    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      items: items.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}
