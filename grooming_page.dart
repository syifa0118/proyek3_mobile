import 'package:flutter/material.dart';

class GroomingPage extends StatelessWidget {
  GroomingPage({super.key});

  final List<Map<String, dynamic>> packages = [
    {
      'id': 'Normal skin',
      'name': 'Normal Skin',
      'price': '30-55.000',
      'features': [
        'S (±1kg) Rp. 30.000',
        'M (2-3kg) Rp. 35.000',
        'L (3-4kg) Rp. 40.000',
        'XL (4-5kg) Rp. 45.000',
        'XXL (5-6kg) Rp. 50.000',
        'JUMBO (>6kg) Rp. 55.000'
      ]
    },
    {
      'id': 'lengkap',
      'name': 'Lengkap (Kutu/Jamur)',
      'price': '35-60.000',
      'features': [
        'S (±1kg) Rp. 35.000',
        'M (2-3kg) Rp. 40.000',
        'L (3-4kg) Rp. 45.000',
        'XL (4-5kg) Rp. 50.000',
        'XXL (5-6kg) Rp. 55.000',
        'JUMBO (>6kg) Rp. 60.000'
      ]
    },
    {
      'id': 'kering',
      'name': 'Kering Lengkap',
      'price': '35-60.000',
      'features': [
        'S (±1kg) Rp. 35.000',
        'M (2-3kg) Rp. 40.000',
        'L (3-4kg) Rp. 45.000',
        'XL (4-5kg) Rp. 50.000',
        'XXL (5-6kg) Rp. 55.000',
        'JUMBO (>6kg) Rp. 60.000'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grooming Profesional"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔹 HERO SECTION
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5D3FD3), Color(0xFF00C9B7)],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Grooming Profesional",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Layanan perawatan hewan terbaik dengan standar internasional.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    "https://images.unsplash.com/photo-1560743641-3914f2c45636",
                    height: 180,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),

            // 🔹 TITLE
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Paket Layanan Grooming",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Harga sesuai berat anabul",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // 🔹 LIST PACKAGE
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final pkg = packages[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          pkg['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Rp ${pkg['price']}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.blue),
                        ),

                        const SizedBox(height: 10),

                        ...pkg['features'].map<Widget>((f) {
                          return Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.green, size: 18),
                              const SizedBox(width: 5),
                              Text(f),
                            ],
                          );
                        }).toList(),

                        const SizedBox(height: 15),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: navigasi ke form booking
                            },
                            child: const Text("Pilih Paket"),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

            // 🔹 BOOKING SECTION
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    "Booking Layanan Grooming",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Pilih paket atau booking langsung",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Booking Sekarang"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Butuh bantuan? 0818-0463-0496",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}