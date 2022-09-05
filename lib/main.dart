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
      appBar: AppBar(title: const Text('Quran Pod')),
      body: FutureBuilder<List<Quran>>(
        initialData: const <Quran>[],
        future: audio.fetchQuran(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // audio.fetchQuran();
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SurahPage(
                          quran: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  title: Text(snapshot.data![index].englishName),
                );
              },
            );
          }
          return const Text('ERROR');
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
    return Scaffold(
      appBar: AppBar(
        title: Text(quran.englishName),
      ),
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Provider.of<AudioProvider>(context, listen: false).open(index + 1);
          },
          title: Text('${quran.englishName}  ${index + 1}'),
        ),
      ),
    );
  }
}
