import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyStd()));
}

class MyStd extends StatelessWidget {
  const MyStd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Google Classroom",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black54),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 230, 115, 198),
            radius: 16,
            child: Text("N", style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          _ClassCard(
            title: "XML và ứng dụng - Nhóm 1",
            code: "2025-2026.1.TIN4583.001",
            students: "58 học viên",
            bgImage:
                "https://plus.unsplash.com/premium_vector-1763221996051-b9131b0123e9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIyfHdoSVkzM3lLRTg0fHxlbnwwfHx8fHw%3D",
          ),
          _ClassCard(
            title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
            code: "2025-2026.1.TIN4403.006",
            students: "55 học viên",
            bgImage:
                "https://plus.unsplash.com/premium_vector-1762967108076-eff9d79a8377?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQ4fHdoSVkzM3lLRTg0fHxlbnwwfHx8fHw%3D",
          ),
          _ClassCard(
            title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
            code: "2025-2026.1.TIN4403.005",
            students: "52 học viên",
            bgImage:
                "https://plus.unsplash.com/premium_vector-1745479655635-104f6817b7f6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUzfHdoSVkzM3lLRTg0fHxlbnwwfHx8fHw%3D",
          ),
          _ClassCard(
            title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
            code: "2025-2026.1.TIN4403.004",
            students: "50 học viên",
            bgImage:
                "https://plus.unsplash.com/premium_vector-1763370265947-63ed2860f891?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExNnx3aElZMzN5S0U4NHx8ZW58MHx8fHx8",
          ),
          _ClassCard(
            title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
            code: "2025-2026.1.TIN4403.003",
            students: "52 học viên",
            bgImage:
                "https://plus.unsplash.com/premium_vector-1711987589978-171fa8d26254?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDI5Nnx3aElZMzN5S0U4NHx8ZW58MHx8fHx8",
          ),
        ],
      ),
    );
  }
}

class _ClassCard extends StatelessWidget {
  final String title;
  final String code;
  final String students;
  final String bgImage;

  const _ClassCard({
    required this.title,
    required this.code,
    required this.students,
    required this.bgImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(bgImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      code,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    students,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
