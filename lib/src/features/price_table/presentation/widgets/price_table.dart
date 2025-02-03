import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/currency.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';

String formatPrice(Currency currency, double? price) {
  if (price == null) return 'N/A';
  return '${currency.symbol}${price.toStringAsFixed(2)}';
}

Widget buildPriceWidget(PriceItem item, Currency currency) {
  final hasDiscount = currency.getDiscountState(item);
  final regularVal =
      currency.getStartPrice(item) ?? currency.getRegularPriceValue(item);
  final discountVal = currency.getDiscountPriceValue(item);

  if (!hasDiscount) {
    return Text(formatPrice(currency, regularVal));
  }

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        formatPrice(currency, regularVal),
        style: const TextStyle(
          decoration: TextDecoration.lineThrough,
          color: Colors.grey,
        ),
      ),
      const SizedBox(width: 2),
      Text(
        formatPrice(currency, discountVal),
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class PriceDataTable extends ConsumerWidget {
  final List<PriceItem> prices;

  const PriceDataTable({required this.prices});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Name')),
          DataColumn(
            label: Text('Price (${selectedCurrency.name})'),
            numeric: true,
          ),
          const DataColumn(label: Text('Category')),
        ],
        rows: prices.map((item) {
          return DataRow(
            cells: [
              DataCell(Text(item.name)),
              DataCell(buildPriceWidget(item, selectedCurrency)),
              DataCell(Text(item.category)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
