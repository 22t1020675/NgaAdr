import 'package:flutter/material.dart';

class MyBMI extends StatefulWidget {
  const MyBMI({super.key});
  @override
  State<MyBMI> createState() => _MyBMIState();
}

class _MyBMIState extends State<MyBMI> {
  final chieucao = TextEditingController();
  final cannang = TextEditingController();
  double? bmi;
  String? phanLoai;
  void tinhBMI() {
    double h = double.tryParse(chieucao.text) ?? 0;
    double w = double.tryParse(cannang.text) ?? 0;
    if (h <= 0 || w <= 0) return;
    h = h / 100;
    double ketQua = w / (h * h);
    String loai = "";
    if (ketQua < 18.5)
      loai = "Thiếu cân";
    else if (ketQua < 25)
      loai = "Bình thường";
    else if (ketQua < 30)
      loai = "Thừa cân";
    else
      loai = "Béo phì";
    setState(() {
      bmi = ketQua;
      phanLoai = loai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // allow scaffold to resize when keyboard opens (default true)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        "Tính Chỉ Số BMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: chieucao,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.height),
                      labelText: "Chiều cao (cm)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cannang,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.monitor_weight),
                      labelText: "Cân nặng (kg)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: tinhBMI,
                    icon: const Icon(Icons.calculate),
                    label: const Text("Tính BMI"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (bmi != null) ...[
                    Text(
                      "Chỉ số BMI: ${bmi!.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFB23A48),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Phân loại: $phanLoai",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
