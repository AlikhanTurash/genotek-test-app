enum Currency {
  EUR('€', 'Euro'),
  USD('\$', 'US Dollar'),
  PEN('S/', 'Peruvian Sol'),
  AED('د.إ', 'UAE Dirham'),
  GBP('£', 'British Pound'),
  JPY('¥', 'Japanese Yen'),
  // Add all other currencies here...
  ;

  final String symbol;
  final String name;

  const Currency(this.symbol, this.name);

  @override
  String toString() => '$name ($symbol)';
}
