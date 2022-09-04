import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:quran_pod/audio_provider.dart';
import 'package:quran_pod/models/quran_audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    ChangeNotifierProvider(
      create: (context) => AudioProvider(Client()),
      builder: (context, child) {
        Provider.of<AudioProvider>(context).fetchQuran();
        return const MyApp();
      },
      // child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AudioProvider>(context).fetchQuran();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final audio = Provider.of<AudioProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: audio.qurans.length,
        itemBuilder: (context, index) {
          // audio.fetchQuran();
          return ListTile(
            title: Text(audio.qurans[index].englishName),
          );
        },
      ),
    );
  }
}

class SurahPage extends StatelessWidget {
  const SurahPage({Key? key, required this.quran}) : super(key: key);
  final Quran quran;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
