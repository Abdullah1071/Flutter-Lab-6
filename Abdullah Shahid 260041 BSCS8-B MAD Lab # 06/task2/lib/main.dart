import 'dart:async';
import 'package:flutter/material.dart';
import './ProfileScreen.dart';
import './LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        ProfileScreen.route: (context) => const ProfileScreen(),
      },
      initialRoute: '/',
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, LoginScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:128,
      color: Colors.white,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
