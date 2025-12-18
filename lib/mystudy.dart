import 'package:flutter/material.dart';
import 'login_api.dart';
import 'mylogin.dart';
import 'myregister.dart';
import 'counterapp.dart';
import 'countdownapp.dart';
import 'bmi.dart';
import 'change_color_app.dart';
import 'myproduct.dart';
import 'newslist.dart';
import 'myvilla.dart';
import 'mystd.dart';
import 'myplace.dart';
import 'feedback.dart';
import 'mywelcome.dart';

enum StudyPage {
  home,
  loginApi,
  loginUi,
  register,
  counter,
  timer,
  bmi,
  changeColor,
  product,
  news,
  villa,
  classroom,
  place,
  feedback,
  welcome,
}

class MyStudy extends StatefulWidget {
  const MyStudy({super.key});

  @override
  State<MyStudy> createState() => _MyStudyState();
}

class _MyStudyState extends State<MyStudy> {
  final Color pinkPrimary = const Color(0xFFEC008C);
  final Color pinkSecondary = const Color(0xFFFC6767);

  bool _isLoggedIn = false;
  bool _obscurePassword = true;
  StudyPage _currentPage = StudyPage.home;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleLogin() {
    if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
      setState(() {
        _isLoggedIn = true;
        _currentPage = StudyPage.home;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Vui lòng nhập tài khoản và mật khẩu!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
      _userController.clear();
      _passController.clear();
      _obscurePassword = true;
    });
  }

  Widget _buildBody() {
    switch (_currentPage) {
      case StudyPage.loginApi:
        return LoginApi(onLoginSuccess: (_) {});
      case StudyPage.loginUi:
        return const MyLogin();
      case StudyPage.register:
        return const MyRegister();
      case StudyPage.counter:
        return const CounterApp();
      case StudyPage.timer:
        return const CountdownApp();
      case StudyPage.bmi:
        return const MyBMI();
      case StudyPage.changeColor:
        return const ChangeColorApp();
      case StudyPage.product:
        return const MyProduct();
      case StudyPage.news:
        return const NewsList();
      case StudyPage.villa:
        return const Myvilla();
      case StudyPage.classroom:
        return const MyStd();
      case StudyPage.place:
        return const MyPlace();
      case StudyPage.feedback:
        return const FeedbackPage();
      case StudyPage.welcome:
        return const MyWelcome();
      default:
        return _buildHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoggedIn) {
      return _buildCompactLoginPage();
    }
    return _buildMainAppLayout();
  }

  Widget _buildCompactLoginPage() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [pinkPrimary, pinkSecondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.auto_stories,
                    size: 50,
                    color: Colors.white,
                  ),
                ),

                const Text(
                  "MY STUDY APP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 25),

                Container(
                  width: 320,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Xin Chào!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 15),

                      TextField(
                        controller: _userController,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: pinkPrimary,
                            size: 20,
                          ),
                          hintText: "Tài khoản",
                          hintStyle: const TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey[100],
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: _passController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: pinkPrimary,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: pinkPrimary,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          hintText: "Mật khẩu",
                          hintStyle: const TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey[100],
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pinkPrimary,
                            foregroundColor: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "ĐĂNG NHẬP",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Chưa có tài khoản? ",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Chuyển sang màn hình Đăng ký"),
                          ),
                        );
                      },
                      child: const Text(
                        "Đăng ký ngay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainAppLayout() {
    String title = "MY STUDY APP";
    if (_currentPage == StudyPage.home) title = "MY STUDY APP";

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [pinkPrimary, pinkSecondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              setState(() => _currentPage = StudyPage.home);
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [pinkPrimary, pinkSecondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 40,
                      color: Color(0xFFEC008C),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Trương Thị Tố Nga",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Mã SV: 22T1020675",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            _buildSection("TÀI KHOẢN"),
            _menuItem("Đăng nhập API", Icons.api, StudyPage.loginApi),
            _menuItem("Đăng nhập", Icons.fingerprint, StudyPage.loginUi),
            _menuItem("Đăng ký", Icons.app_registration, StudyPage.register),

            _buildSection("TIỆN ÍCH"),
            _menuItem("Đếm số", Icons.add_circle_outline, StudyPage.counter),
            _menuItem("Hẹn giờ", Icons.hourglass_bottom, StudyPage.timer),
            _menuItem("BMI", Icons.health_and_safety, StudyPage.bmi),
            _menuItem("Đổi màu", Icons.palette, StudyPage.changeColor),

            _buildSection("ỨNG DỤNG"),
            _menuItem("Sản phẩm", Icons.inventory_2, StudyPage.product),
            _menuItem("Tin tức", Icons.article, StudyPage.news),
            _menuItem("Villa", Icons.holiday_village, StudyPage.villa),
            _menuItem("Lớp học", Icons.cast_for_education, StudyPage.classroom),
            _menuItem("Địa điểm", Icons.place, StudyPage.place),
            _menuItem("Phản hồi", Icons.rate_review, StudyPage.feedback),
            _menuItem(
              "Welcome",
              Icons.sentiment_satisfied_alt,
              StudyPage.welcome,
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Đăng Xuất",
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                Navigator.pop(context);
                _handleLogout();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      body: _buildBody(),
    );
  }

  Widget _buildHomePage() {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [pinkPrimary, pinkSecondary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),

        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: pinkPrimary.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.pink[50],
                        child: Icon(Icons.person, size: 50, color: pinkPrimary),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Trương Thị Tố Nga",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.pink.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          "Mã SV: 22T1020675",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: pinkPrimary,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text(
                        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.pink[300],
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData icon, StudyPage page) {
    bool isSelected = _currentPage == page;
    return ListTile(
      leading: Icon(icon, color: isSelected ? pinkPrimary : Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? pinkPrimary : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.pink[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() => _currentPage = page);
      },
    );
  }
}
