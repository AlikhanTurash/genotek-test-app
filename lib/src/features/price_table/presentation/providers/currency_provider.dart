import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/currency.dart';

final selectedCurrencyProvider = StateProvider<Currency>((ref) => Currency.rub);

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredCurrenciesProvider = Provider<List<Currency>>((ref) {
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  final filteredCurrencies = Currency.values.where((currency) {
    return currency.name.toLowerCase().contains(searchQuery) ||
        currency.symbol.toLowerCase().contains(searchQuery);
  }).toList();

  print(
      'Filtered Currencies (Provider): $filteredCurrencies'); // Print the filtered currencies list

  return filteredCurrencies;
});

final filteredCurrenciesStateProvider =
    StateProvider<List<Currency>>((ref) => Currency.values);
