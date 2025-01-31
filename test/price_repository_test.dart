import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/data/repositories/price_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late PriceRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = PriceRepository(dio: mockDio);
  });

  test('Successful fetch returns list of PriceItems', () async {
    when(() => mockDio.get(any())).thenAnswer(
      (_) async => Response(
        data: [
          {'id': '1', 'name': 'Test', 'price': 10.0, 'category': 'Test'}
        ],
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await repository.fetchPrices();
    expect(result.length, 1);
    expect(result.first.name, 'Test');
  });
}
