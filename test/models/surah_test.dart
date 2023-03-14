import 'package:flutter_test/flutter_test.dart';
import 'package:quran_pod/models/models.dart';

void main() {
  group('Surah', () {
    group('fromMap', () {
      test('returns correct Surah object', () {
        expect(
          Surah.fromMap(
            <String, dynamic>{
              'number': 1,
              'name': 'Al-Faatiha',
              'englishName': 'Al-Faatiha',
              'englishNameTranslation': 'The Opening',
              'numberOfAyahs': 7,
              'revelationType': 'Meccan',
            },
          ),
          isA<Surah>(),
        );
      });
    });
  });
}
