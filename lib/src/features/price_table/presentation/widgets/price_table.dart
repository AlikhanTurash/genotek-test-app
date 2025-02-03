import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';

class PriceDataTable extends ConsumerWidget {
  final List<PriceItem> prices;

  const PriceDataTable({required this.prices});

  bool getDiscountStateForCurrency(PriceItem item, Currency currency) {
    bool discountState;
    switch (currency) {
      case Currency.EUR:
        discountState = item.discountStateEu ?? false;
        print('Item: ${item.name}, EUR Discount State: $discountState');
        print('Raw discountStateEu value: ${item.discountStateEu}');
        return discountState;
      case Currency.USD:
        discountState = item.discountStateUsd ?? false;
        print('Item: ${item.name}, USD Discount State: $discountState');
        print('Raw discountStateUsd value: ${item.discountStateUsd}');
        return discountState;
      case Currency.PEN:
        discountState = item.discountStatePen ?? false;
        print('Item: ${item.name}, PEN Discount State: $discountState');
        print('Raw discountStatePen value: ${item.discountStatePen}');
        return discountState;
    }
  }

  String getRegularPrice(PriceItem item, Currency currency) {
    String price;
    switch (currency) {
      case Currency.EUR:
        price = item.startPriceEu != null
            ? '€${item.startPriceEu!.toStringAsFixed(2)}'
            : (item.priceEu != null
                ? '€${item.priceEu!.toStringAsFixed(2)}'
                : 'N/A');
        print('Item: ${item.name}, EUR Regular Price: $price');
        print(
            'Raw startPriceEu: ${item.startPriceEu}, priceEu: ${item.priceEu}');
        return price;
      case Currency.USD:
        price = item.startPriceUsd != null
            ? '\$${item.startPriceUsd!.toStringAsFixed(2)}'
            : (item.priceUsd != null
                ? '\$${item.priceUsd!.toStringAsFixed(2)}'
                : 'N/A');
        print('Item: ${item.name}, USD Regular Price: $price');
        print(
            'Raw startPriceUsd: ${item.startPriceUsd}, priceUsd: ${item.priceUsd}');
        return price;
      case Currency.PEN:
        price = item.startPricePen != null
            ? 'S/${item.startPricePen!.toStringAsFixed(2)}'
            : (item.pricePen != null
                ? 'S/${item.pricePen!.toStringAsFixed(2)}'
                : 'N/A');
        print('Item: ${item.name}, PEN Regular Price: $price');
        print(
            'Raw startPricePen: ${item.startPricePen}, pricePen: ${item.pricePen}');
        return price;
    }
  }

  String getDiscountPrice(PriceItem item, Currency currency) {
    String price;
    switch (currency) {
      case Currency.EUR:
        price = item.discountPriceEu != null
            ? '€${item.discountPriceEu!.toStringAsFixed(2)}'
            : 'N/A';
        print('Item: ${item.name}, EUR Discount Price: $price');
        print('Raw discountPriceEu: ${item.discountPriceEu}');
        return price;
      case Currency.USD:
        price = item.discountPriceUsd != null
            ? '\$${item.discountPriceUsd!.toStringAsFixed(2)}'
            : 'N/A';
        print('Item: ${item.name}, USD Discount Price: $price');
        print('Raw discountPriceUsd: ${item.discountPriceUsd}');
        return price;
      case Currency.PEN:
        price = item.discountPricePen != null
            ? 'S/${item.discountPricePen!.toStringAsFixed(2)}'
            : 'N/A';
        print('Item: ${item.name}, PEN Discount Price: $price');
        print('Raw discountPricePen: ${item.discountPricePen}');
        return price;
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
