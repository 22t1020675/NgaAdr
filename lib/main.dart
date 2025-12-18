import 'package:flutter/material.dart';
import 'package:appp_hi/mystudy.dart';
import 'package:appp_hi/login_api.dart';
import 'package:appp_hi/mylogin.dart';
import 'package:appp_hi/myregister.dart';
import 'package:appp_hi/counterapp.dart';
import 'package:appp_hi/countdownapp.dart';
import 'package:appp_hi/bmi.dart';
import 'package:appp_hi/change_color_app.dart';
import 'package:appp_hi/myproduct.dart';
import 'package:appp_hi/newslist.dart';
import 'package:appp_hi/feedback.dart';
import 'package:appp_hi/mywelcome.dart';
import 'package:appp_hi/mystd.dart';
import 'package:appp_hi/myhomepage.dart';
import 'package:appp_hi/myplace.dart';
import 'package:appp_hi/myvilla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App_N3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const MyStudy(),
      routes: {
        '/mystudy': (context) => const MyStudy(),
        '/loginapi': (context) => LoginApi(onLoginSuccess: (_) {}),
        '/mylogin': (context) => const MyLogin(),
        '/myregister': (context) => const MyRegister(),
        '/counterapp': (context) => const CounterApp(),
        '/timer': (context) => const CountdownApp(),
        '/bmi': (context) => const MyBMI(),
        '/change_color': (context) => const ChangeColorApp(),
        '/product': (context) => const MyProduct(),
        '/news_list': (context) => const NewsList(),
        '/feedback': (context) => const FeedbackPage(),
        '/welcome': (context) => const MyWelcome(),
        '/classroom': (context) => const MyStd(),
        '/homepage': (context) => const MyHomePage(),
        '/myplace': (context) => const MyPlace(),
        '/myvilla': (context) => const Myvilla(),
      },
    );
  }
}
