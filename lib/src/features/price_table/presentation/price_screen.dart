import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genotek_test_app/src/features/price_table/data/repositories/price_repository.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/widgets/price_table.dart';
import 'package:genotek_test_app/src/features/price_table/presentation/widgets/currency_selector.dart';

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
          const CurrencySelector(),
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
        error: (error, stack) => _ErrorView(
          error: error,
          onRetry: () => ref.invalidate(priceRepositoryProvider),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ErrorView extends ConsumerWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage =
        error.toString().replaceAll('PriceRepositoryException: ', '');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Connection Error:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
