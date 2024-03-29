import 'package:flutter/material.dart';
import 'package:quran_pod/pages/pages.dart';

class QuranPod extends StatelessWidget {
  const QuranPod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al-Qur'an Pod",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
