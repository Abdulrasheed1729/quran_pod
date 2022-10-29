import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp()
      // child: const MyApp(),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Pod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
