import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/data/repositories/price_repository.dart';
import 'package:genotek_test_app/src/features/price_table/domain/models/price_item.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/providers/currency_provider.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/widgets/price_table.dart';

class PriceScreen extends ConsumerStatefulWidget {
  const PriceScreen({super.key});

  @override
  ConsumerState<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends ConsumerState<PriceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pricesAsync = ref.watch(priceRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genotek Price List'),
        actions: [
          DropdownButton<Currency>(
            value: ref.watch(selectedCurrencyProvider),
            items: Currency.values.map((currency) {
              return DropdownMenuItem(
                value: currency,
                child: Text(currency.name),
              );
            }).toList(),
            onChanged: (Currency? newCurrency) {
              if (newCurrency != null) {
                ref.read(selectedCurrencyProvider.notifier).state = newCurrency;
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(priceRepositoryProvider),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Genealogy'),
            Tab(text: 'Genetics'),
            Tab(text: 'Premium'),
            Tab(text: 'Diagnostics'),
          ],
        ),
      ),
      body: pricesAsync.when(
        data: (tables) => TabBarView(
          controller: _tabController,
          children: [
            PriceDataTable(prices: tables['genealogy'] ?? []),
            PriceDataTable(prices: tables['genetics'] ?? []),
            PriceDataTable(prices: tables['premium'] ?? []),
            PriceDataTable(prices: tables['diagnostics'] ?? []),
          ],
        ),
        error: (error, _) => _ErrorView(error: error),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

// class _PriceDataTable extends StatelessWidget {
//   final List<PriceItem> prices;

//   const _PriceDataTable({required this.prices});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SingleChildScrollView(
//         child: DataTable(
//           columnSpacing: 20,
//           columns: const [
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('EUR'), numeric: true),
//             DataColumn(label: Text('USD'), numeric: true),
//             DataColumn(label: Text('PEN'), numeric: true),
//             DataColumn(label: Text('AED'), numeric: true),
//             DataColumn(label: Text('GBP'), numeric: true),
//             DataColumn(label: Text('JPY'), numeric: true),
//             DataColumn(label: Text('Category')),
//             DataColumn(label: Text('Discount')),
//           ],
//           rows: prices
//               .map((item) => DataRow(
//                     cells: [
//                       DataCell(Text(item.name)),
//                       DataCell(Text(item.priceEu != null
//                           ? '€${item.priceEu!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.priceUsd != null
//                           ? '\$${item.priceUsd!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.pricePen != null
//                           ? 'S/${item.pricePen!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.priceAED != null
//                           ? 'د.إ${item.priceAED!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.priceGBP != null
//                           ? '£${item.priceGBP!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.priceJPY != null
//                           ? '¥${item.priceJPY!.toStringAsFixed(2)}'
//                           : 'N/A')),
//                       DataCell(Text(item.category)),
//                       DataCell(item.discountState
//                           ? const Icon(Icons.check_circle, color: Colors.green)
//                           : const Icon(Icons.cancel, color: Colors.red)),
//                     ],
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

class _ErrorView extends ConsumerWidget {
  final Object error;

  const _ErrorView({required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48),
          const SizedBox(height: 16),
          Text('Error loading data: ${error.toString()}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(priceRepositoryProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
