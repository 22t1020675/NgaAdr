import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const CountdownApp());
}

class CountdownApp extends StatelessWidget {
  const CountdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CountdownHome(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
      ),
    );
  }
}

class CountdownHome extends StatefulWidget {
  const CountdownHome({super.key});

  @override
  State<CountdownHome> createState() => _CountdownHomeState();
}

class _CountdownHomeState extends State<CountdownHome> {
  final TextEditingController timeController = TextEditingController();
  Timer? _timer;
  int seconds = 0;
  bool isRunning = false;
  bool _dialogShown = false;
  void startTimer() {
    if (timeController.text.isEmpty) return;

    seconds = int.tryParse(timeController.text) ?? 0;
    if (seconds <= 0) return;

    _dialogShown = false;
    setState(() => isRunning = true);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        timer.cancel();
        isRunning = false;

        if (_dialogShown) return;
        _dialogShown = true;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return AlertDialog(
              title: const Text("⏰ Hết thời gian!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      seconds = 0;
      timeController.clear();
      isRunning = false;
      _dialogShown = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    timeController.dispose();
    super.dispose();
  }

  String formatTime(int s) {
    final int min = s ~/ 60;
    final int sec = s % 60;
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bộ đếm thời gian"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              const Text(
                "Nhập số giây cần đếm",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 140,
                child: TextField(
                  controller: timeController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "VD: 10",
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                formatTime(seconds),
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: isRunning ? null : startTimer,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Bắt đầu"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton.icon(
                    onPressed: resetTimer,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Đặt lại"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
