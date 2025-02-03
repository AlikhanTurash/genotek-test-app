import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/currency_provider.dart';

import 'package:genotek_test_app/src/features/price_table/domain/models/currency.dart';

class CurrencySelector extends ConsumerStatefulWidget {
  const CurrencySelector({super.key});

  @override
  ConsumerState<CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends ConsumerState<CurrencySelector> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref.read(searchQueryProvider.notifier).state = _searchController.text;
    ref.read(filteredCurrenciesStateProvider.notifier).state =
        ref.read(filteredCurrenciesProvider);
  }

  void _resetSearch() {
    _searchController.clear();
    ref.read(searchQueryProvider.notifier).state = '';
    ref.read(filteredCurrenciesStateProvider.notifier).state = Currency.values;
  }

  @override
  Widget build(BuildContext context) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);

    return IconButton(
      icon: Text(
        selectedCurrency.symbol,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        _searchController.clear();
        showDialog(
          context: context,
          builder: (dialogContext) => Consumer(
            builder: (dialogContext, ref, child) {
              final filteredCurrencies =
                  ref.watch(filteredCurrenciesStateProvider);

              return PopScope(
                onPopInvoked: (_) => _searchController.clear(),
                child: Dialog(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Search currency...',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _resetSearch,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredCurrencies.length,
                              itemBuilder: (context, index) {
                                final currency = filteredCurrencies[index];
                                return ListTile(
                                  leading: Text(
                                    currency.symbol,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  title: Text(currency.name),
                                  selected: currency ==
                                      ref.watch(selectedCurrencyProvider),
                                  onTap: () {
                                    ref
                                        .read(selectedCurrencyProvider.notifier)
                                        .state = currency;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
