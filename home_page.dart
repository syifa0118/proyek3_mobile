import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomNavbar(), 

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _heroSection(),
                  _servicesSection(),
                  const Footer(), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(93, 63, 211, 0.08),
            Color.fromRGBO(0, 201, 183, 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool mobile = constraints.maxWidth < 800;

          return mobile
              ? Column(
                  children: [
                    _heroText(),
                    const SizedBox(height: 30),
                    _heroImage(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _heroText()),
                    Expanded(child: _heroImage()),
                  ],
                );
        },
      ),
    );
  }

  Widget _heroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Perawatan Terbaik untuk Hewan Peliharaan Anda",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Kami menyediakan layanan grooming, penitipan, dan perawatan lengkap untuk hewan peliharaan Anda dengan standar profesional dan penuh kasih sayang.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {},
          child: const Text("Lihat Layanan Kami"),
        ),
      ],
    );
  }

  Widget _heroImage() {
    return Transform(
      transform: Matrix4.identity()..rotateY(-0.3),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "img/HOME-removebg-preview.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _servicesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Layanan Unggulan Kami",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Kami menawarkan berbagai layanan berkualitas tinggi untuk menjaga kesehatan dan kebahagiaan hewan peliharaan Anda.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              int count = constraints.maxWidth < 800 ? 1 : 2;

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: count,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
                children: [
                  _serviceCard(
                    icon: Icons.spa,
                    title: "Grooming Profesional",
                    desc:
                        "Layanan grooming lengkap mulai dari mandi, potong kuku, hingga styling bulu.",
                  ),
                  _serviceCard(
                    icon: Icons.home,
                    title: "Penitipan Hewan",
                    desc:
                        "Tempat penitipan hewan yang nyaman dan aman dengan pengawasan 24 jam.",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _serviceCard({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            child: Icon(icon, size: 30, color: Colors.deepPurple),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text("Selengkapnya →"),
          )
        ],
      ),
    );
  }
}