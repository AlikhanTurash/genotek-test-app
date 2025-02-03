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
      case Currency.eur:
        return item.discountStateEu ?? false;
      case Currency.usd:
        return item.discountStateUsd ?? false;
      case Currency.pen:
        return item.discountStatePen ?? false;
      case Currency.clp:
        return item.discountStateCl ?? false;
      case Currency.aed:
        return item.discountStateAed ?? false;
      case Currency.all:
        return item.discountStateAll ?? false;
      // Add cases for all other currencies
      default:
        return false;
    }
  }

  String getRegularPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.eur:
        return item.startPriceEu != null
            ? '€${item.startPriceEu!.toStringAsFixed(2)}'
            : (item.priceEu != null
                ? '€${item.priceEu!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.usd:
        return item.startPriceUsd != null
            ? '\$${item.startPriceUsd!.toStringAsFixed(2)}'
            : (item.priceUsd != null
                ? '\$${item.priceUsd!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.clp:
        return item.startPriceCl != null
            ? 'CL\$${item.startPriceCl!.toStringAsFixed(2)}'
            : (item.priceCl != null
                ? 'CL\$${item.priceCl!.toStringAsFixed(2)}'
                : 'N/A');
      case Currency.all:
        return item.startPriceAll != null
            ? 'L${item.startPriceAll!.toStringAsFixed(2)}'
            : (item.priceAll != null
                ? 'L${item.priceAll!.toStringAsFixed(2)}'
                : 'N/A');
      // Add cases for all other currencies following the same pattern
      default:
        return 'N/A';
    }
  }

  String getDiscountPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.eur:
        return item.discountPriceEu != null
            ? '€${item.discountPriceEu!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.usd:
        return item.discountPriceUsd != null
            ? '\$${item.discountPriceUsd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.clp:
        return item.discountPriceCl != null
            ? 'CL\$${item.discountPriceCl!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.all:
        return item.discountPriceAll != null
            ? 'L${item.discountPriceAll!.toStringAsFixed(2)}'
            : 'N/A';
      // Add cases for all other currencies following the same pattern
      default:
        return 'N/A';
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
