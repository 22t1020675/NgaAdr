import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterHome(), debugShowCheckedModeBanner: false);
  }
}

class CounterHome extends StatefulWidget {
  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  int counter = 0;
  final List<Color> colors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.black,
  ];
  Color getColor(int value) {
    int index = value.abs() % colors.length;
    return value == 0 ? Colors.grey : colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đếm Số"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Giá trị hiện tại:", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text(
              "$counter",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: getColor(counter),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Giảm
                ElevatedButton.icon(
                  onPressed: () => setState(() => counter--),
                  icon: const Icon(Icons.remove),
                  label: const Text("Giảm"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                //Reset
                ElevatedButton.icon(
                  onPressed: () => setState(() => counter = 0),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
                const SizedBox(width: 10),
                //Tăng
                ElevatedButton.icon(
                  onPressed: () => setState(() => counter++),
                  icon: const Icon(Icons.add),
                  label: const Text("Tăng"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
