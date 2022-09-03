import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:quran_pod/cubits/cubit/quran_audio_cubit.dart';
import 'package:quran_pod/repository/quran_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => QuranAudioCubit(
          quranRepository: QuranRepository(
            httpClient: Client(),
          ),
        ),
        child: const MyHomePage(),
      ),
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
    context.read<QuranAudioCubit>().loadQuranAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuranAudioCubit, QuranAudioState>(
        builder: (context, state) {
          if (state is QuranAudioLoaded) {
            return ListView.builder(
              itemCount: state.quranAudio.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    state.quranAudio[index].englishName,
                  ),
                );
              },
            );
          } else {
            return const Text('data');
          }
        },
      ),
    );
  }
}
