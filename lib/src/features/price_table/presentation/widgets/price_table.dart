import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';

class PriceDataTable extends ConsumerWidget {
  final List<PriceItem> prices;

  const PriceDataTable({required this.prices});

  String getFormattedPrice(PriceItem item, Currency currency) {
    switch (currency) {
      case Currency.EUR:
        if (!item.discountState) {
          return item.priceEu != null
              ? '€${item.priceEu!.toStringAsFixed(2)}'
              : 'N/A';
        }
        return item.startPriceEu != null
            ? '€${item.startPriceEu!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.USD:
        if (!item.discountState) {
          return item.priceUsd != null
              ? '\$${item.priceUsd!.toStringAsFixed(2)}'
              : 'N/A';
        }
        return item.startPriceUsd != null
            ? '\$${item.startPriceUsd!.toStringAsFixed(2)}'
            : 'N/A';
      case Currency.PEN:
        if (!item.discountState) {
          return item.pricePen != null
              ? 'S/${item.pricePen!.toStringAsFixed(2)}'
              : 'N/A';
        }
        return item.startPricePen != null
            ? 'S/${item.startPricePen!.toStringAsFixed(2)}'
            : 'N/A';
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
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),
            child: DataTable(
              columnSpacing: 20,
              horizontalMargin: 16,
              columns: [
                const DataColumn(
                  label: Text('Name'),
                  // flex: 2,
                ),
                DataColumn(
                  label: Text('Price (${selectedCurrency.name})'),
                  numeric: true,
                  // flex: 2,
                ),
                const DataColumn(
                  label: Text('Category'),
                  // flex: 2,
                ),
              ],
              rows: prices
                  .map((item) => DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            item.discountState
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        getFormattedPrice(
                                            item, selectedCurrency),
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        getDiscountPrice(
                                            item, selectedCurrency),
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    getFormattedPrice(item, selectedCurrency)),
                          ),
                          DataCell(Text(item.category)),
                        ],
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
