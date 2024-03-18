import 'package:flutter/material.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.imagesMenu,
          height: 24,
          width: 24,
        ),
        title: Text("Football Shuru"),
      ),
    );
  }
}
