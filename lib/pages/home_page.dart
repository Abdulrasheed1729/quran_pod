import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quran_pod/models/models.dart';
import 'package:quran_pod/pages/audio_player_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Reciter>> reciters;

  @override
  void initState() {
    super.initState();
    reciters = fetchReciters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Al-Qur\'an Pod'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFF144771),
              Color(0XFF071A2c),
            ],
          ),
        ),
        child: FutureBuilder<List<Reciter>>(
          future: reciters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      height: 70,
                      color: Colors.transparent,
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/alquran.jpg'),
                        ),
                        title: AutoSizeText(
                          snapshot.data![index].name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AudioPlayerPage(
                                reciter: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error Loading Reciters'),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
              ));
            }
          },
        ),
      ),
    );
  }
}
