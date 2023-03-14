import 'package:flutter_test/flutter_test.dart';
import 'package:quran_pod/models/models.dart';

void main() {
  group('Reciter', () {
    group('fromMap', () {
      test('returns correct Reciter object', () {
        expect(
          Reciter.fromMap(
            <String, dynamic>{
              'identifier': 'ar.abdulazizazzahrani',
              'language': 'ar',
              'name': 'Abdulaziz Az-Zahrani',
              'englishName': 'Abdulaziz Az-Zahrani',
              'format': 'audio',
              'type': 'surahbysurah',
            },
          ),
          isA<Reciter>(),
        );
      });
    });
  });
}
