import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyPlace()));
}

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            block1(),
            const SizedBox(height: 20),
            block2(),
            const SizedBox(height: 15),
            block3(),
            const SizedBox(height: 15),
            block4(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    var src =
        "https://plus.unsplash.com/premium_photo-1661962542692-4fe7a4ad6b54?q=80&w=1171&auto=format&fit=crop";
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      child: SizedBox(
        width: double.infinity,
        height: 280,
        child: Image.network(src, fit: BoxFit.cover),
      ),
    );
  }

  Widget block2() {
    var namePlace = "Hoang mạc Sahara";
    var addressPlace = "Châu Phi";
    var votePlace = "41";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namePlace,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      addressPlace,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.red, size: 20),
                const SizedBox(width: 4),
                Text(
                  votePlace,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPrettyButton(Icons.call, "Call", Colors.blue),
          _buildPrettyButton(Icons.near_me, "Route", Colors.green),
          _buildPrettyButton(Icons.share, "Share", Colors.purple),
        ],
      ),
    );
  }

  Widget _buildPrettyButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget block4() {
    var data =
        "Hoang mạc Sahara nằm ở phần lớn khu vực Bắc Phi, trải dài trên diện tích lớn, bao phủ gần như toàn bộ Bắc Phi và chiếm khoảng 31% diện tích lục địa này. Nó bao gồm phần lớn các quốc gia như Algeria, Chad, Ai Cập, Libya, Mali, Mauritania, Niger, Tây Sahara, Sudan, và một phần của Morocco và Tunisia.";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        data,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.5),
      ),
    );
  }
}
