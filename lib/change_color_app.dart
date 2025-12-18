import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeColorApp(),
    );
  }
}

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor = Colors.green;
  String bgColorString = 'Xanh lá';

  List<String> ListColorString = [
    'Xanh lá',
    'Xanh da trời',
    'Đỏ',
    'Hồng',
    'Tím',
    'Xanh ngọc',
  ];

  List<Color> ListColor = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.teal,
  ];

  void _changeColor() {
    setState(() {
      var random = Random();
      var r = random.nextInt(ListColor.length);
      bgColor = ListColor[r];
      bgColorString = ListColorString[r];
    });
  }

  void _resetColor() {
    setState(() {
      bgColor = Colors.green;
      bgColorString = "Xanh lá";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.colorize_sharp),
        title: const Text(
          "Change Color App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Màu hiện tại",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              bgColorString,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _changeColor,
                  icon: const Icon(Icons.color_lens),
                  label: const Text("Change Color"),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: _resetColor,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
