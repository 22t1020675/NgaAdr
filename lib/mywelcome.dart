import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyWelcome()));
}

class MyWelcome extends StatelessWidget {
  const MyWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100], body: myBody(context));
  }

  Widget myBody(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 40 - 15) / 2;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildIconBtn(Icons.notifications_none),
              const SizedBox(width: 10),
              _buildIconBtn(Icons.settings),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Welcome,",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Text(
                "Charlie",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              const SizedBox(width: 8),
              const Text(
                "👋",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Saved Places",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              placeItem(
                "Grand Place",
                "https://media.istockphoto.com/id/184839780/vi/anh/grand-place-%E1%BB%9F-brussels.jpg?s=612x612&w=0&k=20&c=eO1pjKmUO9B56cezwjvGx8e5UDgAw6y4dudJdY4yPOU=",
                itemWidth,
              ),
              placeItem(
                "Brussels",
                "https://media.istockphoto.com/id/505233495/vi/anh/%C4%91%E1%BA%A1i-%C4%91%E1%BB%8Ba-%C4%91i%E1%BB%83m-brussels.jpg?s=612x612&w=0&k=20&c=VHuP-aj93jGXIBV27TEE3rswajYH9qlH1HjM8qMemnI=",
                itemWidth,
              ),
              placeItem(
                "Heddal Church",
                "https://media.istockphoto.com/id/1033327096/vi/anh/heddal-01-th%C3%A1ng-8-n%C4%83m-2018-nh%C3%A0-th%E1%BB%9D-heddal-th%E1%BB%9Di-trung-c%E1%BB%95-nh%C3%A0-th%E1%BB%9D-l%E1%BB%9Bn-nh%E1%BA%A5t-c%C3%B2n-l%E1%BA%A1i-%E1%BB%9F-telemark-na.jpg?s=612x612&w=0&k=20&c=46pE4_AcfMWMUXP0BeW0lm0UXvY8k3ipIw14cSv98gE=",
                itemWidth,
              ),
              placeItem(
                "Alquezar",
                "https://media.istockphoto.com/id/1321491788/vi/anh/ho%C3%A0ng-h%C3%B4n-%E1%BB%9F-th%E1%BB%8B-tr%E1%BA%A5n-th%E1%BB%9Di-trung-c%E1%BB%95-alquezar-t%E1%BB%89nh-huesca-aragon-t%C3%A2y-ban-nha.jpg?s=612x612&w=0&k=20&c=fpnDQ35uWqkVPxoxnGuj8nGlWnYJcWUX5daFgepSFrM=",
                itemWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 24, color: Colors.black87),
    );
  }

  Widget placeItem(String title, String imageUrl, double width) {
    return Container(
      width: width,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}