import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A2E),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // GRID
          Wrap(
            spacing: 40,
            runSpacing: 30,
            alignment: WrapAlignment.spaceBetween,
            children: [
              _column1(),
              _column2(),
              _column3(),
            ],
          ),

          const SizedBox(height: 30),

          const Divider(color: Colors.white24),

          const SizedBox(height: 10),

          const Text(
            "© 2026 HachiPetShop",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget _column1() {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "HachiPetShop",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Perawatan terbaik untuk hewan peliharaan Anda.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _column2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Layanan",
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 10),
        Text("Grooming", style: TextStyle(color: Colors.grey)),
        Text("Penitipan Hewan", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _column3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Kontak",
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 10),
        Text("0818-0463-0496", style: TextStyle(color: Colors.grey)),
        Text("@hachipetshopindramayu",
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}