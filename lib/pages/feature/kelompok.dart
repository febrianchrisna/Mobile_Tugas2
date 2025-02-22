import 'package:flutter/material.dart';
import 'package:tugas2/pages/home/home.dart';
import 'package:tugas2/pages/main/consts.dart';

class TeamPage extends StatelessWidget {
  final List<TeamMember> members = [
    TeamMember(
      name: "Febrian Chrisna A.",
      nim: "123220051",
      imagePath: "assets/images/febrian.jpg", // Ganti dengan path gambar
    ),
    TeamMember(
      name: "Nurma Intan H.",
      nim: "123220046",
      imagePath: "assets/images/intan.jpg",
    ),
    TeamMember(
      name: "Arditho Damas K.",
      nim: "123220048",
      imagePath: "assets/images/dito.jpg", // Ganti dengan path gambar
    ),
    TeamMember(
      name: "Vinsensius Johan",
      nim: "1232200",
      imagePath: "assets/images/Johan.png", // Ganti dengan path gambar
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: g1, // Ganti dengan warna g1 sesuai kebutuhan
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [g1, g2], // g1 dan g2 adalah warna gradien
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Meet Our Team',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Teks warna putih untuk kontras dengan latar belakang gelap
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return TeamMemberCard(member: members[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String nim;
  final String imagePath;

  TeamMember({
    required this.name,
    required this.nim,
    required this.imagePath,
  });
}

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(member.imagePath),
            // Jika gambar tidak ada, tampilkan icon placeholder
            child: member.imagePath.isEmpty
                ? const Icon(Icons.person, size: 60)
                : null,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          member.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          member.nim,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
