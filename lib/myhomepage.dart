import 'package:flutter/material.dart';
void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Xin chào moi người!",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Icon(Icons.heart_broken, size: 100, color: Colors.red),
          Text(
            "Lập trình di động - nhóm 3",
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
