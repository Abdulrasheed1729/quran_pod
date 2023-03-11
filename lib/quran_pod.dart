import 'package:flutter/material.dart';
import 'package:quran_pod/pages/pages.dart';

class QuranPod extends StatelessWidget {
  const QuranPod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Pod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
