import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Currency { EUR, USD, PEN }

final selectedCurrencyProvider = StateProvider<Currency>((ref) => Currency.EUR);
