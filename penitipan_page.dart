import 'package:flutter/material.dart';

class PenitipanPage extends StatelessWidget {
  PenitipanPage({super.key});

  final List<Map<String, dynamic>> packages = [
    {
      'name': '1 Kandang 1 Ekor',
      'price': '20-25.000',
      'features': [
        'Makan sendiri Rp.20.000/malam',
        'Tidak membawa Rp.25.000/malam',
        'Makan 3x sehari',
        'Air minum bersih',
        'Pembersihan kandang',
        'Monitoring 24 jam'
      ]
    },
    {
      'name': '1 Kandang 2 Ekor',
      'price': '30-40.000',
      'features': [
        'Makan sendiri Rp.30.000/malam',
        'Tidak membawa Rp.40.000/malam',
        'Makan 3x sehari',
        'Air minum bersih',
        'Pembersihan kandang',
        'Monitoring 24 jam'
      ]
    },
    {
      'name': 'Kandang besar 3 Ekor',
      'price': '60-70.000',
      'features': [
        'Makan sendiri Rp.60.000/malam',
        'Tidak membawa Rp.70.000/malam',
        'Makan 3x sehari',
        'Air minum bersih',
        'Pembersihan kandang',
        'Monitoring 24 jam'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PetCare"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // HERO
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.2),
                    Colors.pink.withOpacity(0.2)
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Penitipan Hewan Profesional",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Layanan penitipan hewan terpercaya dan aman",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Booking Sekarang"),
                  )
                ],
              ),
            ),

            // FITUR
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Mengapa Memilih Kami?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      feature(Icons.security, "Aman"),
                      feature(Icons.medical_services, "Medis"),
                      feature(Icons.favorite, "Kasih"),
                      feature(Icons.videocam, "Update"),
                    ],
                  )
                ],
              ),
            ),

            // PAKET
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Paket Layanan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  ...packages.map((pkg) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pkg['name'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text("Rp ${pkg['price']}",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16)),

                            const SizedBox(height: 10),

                            ...pkg['features'].map<Widget>((f) {
                              return Row(
                                children: [
                                  const Icon(Icons.check,
                                      color: Colors.green,
                                      size: 16),
                                  const SizedBox(width: 5),
                                  Text(f),
                                ],
                              );
                            }).toList(),

                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // nanti bisa ke halaman form booking
                                },
                                child: const Text("Pilih Paket"),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            // BOOKING
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Booking Sekarang",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Booking"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget feature(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 5),
        Text(text)
      ],
    );
  }
}