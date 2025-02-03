import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/currency.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';

class PriceDataTable extends ConsumerWidget {
  final List<PriceItem> prices;

  const PriceDataTable({required this.prices});

  bool getDiscountStateForCurrency(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.EUR:
        return item.discountStateEu ?? false;
      case Currency.USD:
        return item.discountStateUsd ?? false;
      case Currency.PEN:
        return item.discountStatePen ?? false;
      default:
        return false; // Default behavior for other currencies
    }
  }

  String getRegularPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.EUR:
        return item.startPriceEu != null
            ? '€${item.startPriceEu!.toStringAsFixed(2)}'
            : (item.priceEu != null
                ? '€${item.priceEu!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.USD:
        return item.startPriceUsd != null
            ? '\$${item.startPriceUsd!.toStringAsFixed(2)}'
            : (item.priceUsd != null
                ? '\$${item.priceUsd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.PEN:
        return item.startPricePen != null
            ? 'S/${item.startPricePen!.toStringAsFixed(2)}'
            : (item.pricePen != null
                ? 'S/${item.pricePen!.toStringAsFixed(2)}'
                : 'N/A');
      default:
        return 'N/A'; // Default behavior for other currencies
    }
  }

  String getDiscountPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.EUR:
        return item.discountPriceEu != null
            ? '€${item.discountPriceEu!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.USD:
        return item.discountPriceUsd != null
            ? '\$${item.discountPriceUsd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.PEN:
        return item.discountPricePen != null
            ? 'S/${item.discountPricePen!.toStringAsFixed(2)}'
            : 'N/A';
      default:
        return 'N/A'; // Default behavior for other currencies
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Name')),
          DataColumn(
              label: Text('Price (${selectedCurrency.name})'), numeric: true),
          const DataColumn(label: Text('Category')),
        ],
        rows: prices
            .map((item) => DataRow(
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(
                      getDiscountStateForCurrency(item, selectedCurrency)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  getRegularPrice(item, selectedCurrency),
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  getDiscountPrice(item, selectedCurrency),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(getRegularPrice(item, selectedCurrency)),
                    ),
                    DataCell(Text(item.category)),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
