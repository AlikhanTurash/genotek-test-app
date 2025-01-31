// lib/src/features/price_table/data/repositories/price_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/core/network/dio_client.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';

final priceRepositoryProvider =
    AsyncNotifierProvider<PriceRepository, Map<String, List<PriceItem>>>(() {
  return PriceRepository(dio: DioClient.instance);
});

class PriceRepository extends AsyncNotifier<Map<String, List<PriceItem>>> {
  final Dio dio;

  PriceRepository({required this.dio});

  Future<Map<String, List<PriceItem>>> fetchPrices() async {
    try {
      final response = await dio.get('https://back.genotek.ru/api/price/');
      final Map<String, dynamic> data = response.data;

      final Map<String, List<PriceItem>> tables = {
        'genealogy': [],
        'genetics': [],
        'premium': [],
        'diagnostics': [],
      };

      // Process diagnostic data differently
      if (data.containsKey('diagnostic')) {
        final diagnosticData = data['diagnostic'] as Map<String, dynamic>;
        tables['diagnostics'] = diagnosticData.entries.map((entry) {
          final itemData = entry.value as Map<String, dynamic>;
          return PriceItem.fromJson({
            'id': entry.key,
            'name': itemData['name'] as String? ?? 'Unknown',
            'category': 'Diagnostics', // Set default category
            'discountState': itemData['discountState'] ?? false,
            'price': itemData['price']?.toDouble(),
            'priceEu': itemData['priceEu']?.toDouble(),
            'priceUsd': itemData['priceUsd']?.toDouble(),
            'pricePen': itemData['pricePen']?.toDouble(),
            'priceAED': itemData['priceAED']?.toDouble(),
            'priceGBP': itemData['priceGBP']?.toDouble(),
            'priceJPY': itemData['priceJPY']?.toDouble(),
          });
        }).toList();
      }

      // Process genetics data
      if (data.containsKey('genetics')) {
        final geneticsData = data['genetics'] as Map<String, dynamic>;
        tables['genetics'] = geneticsData.entries.map((entry) {
          final itemData = entry.value as Map<String, dynamic>;
          return PriceItem.fromJson({
            'id': entry.key,
            'name': itemData['name'] as String? ?? 'Unknown',
            'category': itemData['category'] as String? ?? 'Genetics',
            'discountState': itemData['discountState'] ?? false,
            'discountPrice': itemData['discountPrice']?.toDouble(),
            'discountSize': itemData['discountSize'] as String?,
            'price': itemData['price']?.toDouble(),
            'startPrice': itemData['startPrice']?.toDouble(),
            'priceEu': itemData['priceEu']?.toDouble(),
            'priceUsd': itemData['priceUsd']?.toDouble(),
            'pricePen': itemData['pricePen']?.toDouble(),
            'priceAED': itemData['priceAED']?.toDouble(),
            'priceGBP': itemData['priceGBP']?.toDouble(),
            'priceJPY': itemData['priceJPY']?.toDouble(),
            'description': itemData['description'] as String?,
            'href': itemData['href'] as String?,
          });
        }).toList();
      }

      // Process other tables as before
      for (final table in ['genealogy', 'premium']) {
        if (data.containsKey(table)) {
          final tableData = data[table] as Map<String, dynamic>;
          tables[table] = tableData.entries.map((entry) {
            final itemData = entry.value as Map<String, dynamic>;
            return PriceItem.fromJson({
              ...itemData,
              'id': entry.key,
              'name': itemData['name'] as String? ?? 'Unknown',
              'category': itemData['category'] as String? ?? table.capitalize(),
              'discountState': itemData['discountState'] ?? false,
              'price': itemData['price']?.toDouble(),
              'priceEu': itemData['priceEu']?.toDouble(),
              'priceUsd': itemData['priceUsd']?.toDouble(),
              'pricePen': itemData['pricePen']?.toDouble(),
              'priceAED': itemData['priceAED']?.toDouble(),
              'priceGBP': itemData['priceGBP']?.toDouble(),
              'priceJPY': itemData['priceJPY']?.toDouble(),
            });
          }).toList();
        }
      }

      return tables;
    } on DioException catch (e) {
      throw PriceRepositoryException(e.message ?? 'Failed to fetch prices');
    }
  }

  @override
  Future<Map<String, List<PriceItem>>> build() {
    return fetchPrices();
  }
}

class PriceRepositoryException implements Exception {
  final String message;
  PriceRepositoryException(this.message);
}

// Add extension method for string capitalization
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
