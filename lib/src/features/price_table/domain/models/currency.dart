enum Currency {
  clp('CLP', 'Chilean Peso', 'CL\$'),
  eur('EUR', 'Euro', '€'),
  pen('PEN', 'Peruvian Sol', 'S/'),
  usd('USD', 'US Dollar', '\$'),
  aed('AED', 'UAE Dirham', 'د.إ'),
  all('ALL', 'Albanian Lek', 'L'),
  amd('AMD', 'Armenian Dram', '֏'),
  aoa('AOA', 'Angolan Kwanza', 'Kz'),
  aud('AUD', 'Australian Dollar', 'A\$'),
  bam('BAM', 'Bosnia-Herzegovina Convertible Mark', 'KM'),
  bdt('BDT', 'Bangladeshi Taka', '৳'),
  czk('CZK', 'Czech Koruna', 'Kč'),
  dkk('DKK', 'Danish Krone', 'kr'),
  dzd('DZD', 'Algerian Dinar', 'د.ج'),
  egp('EGP', 'Egyptian Pound', 'E£'),
  etb('ETB', 'Ethiopian Birr', 'Br'),
  gel('GEL', 'Georgian Lari', '₾'),
  hkd('HKD', 'Hong Kong Dollar', 'HK\$'),
  huf('HUF', 'Hungarian Forint', 'Ft'),
  inr('INR', 'Indian Rupee', '₹'),
  kes('KES', 'Kenyan Shilling', 'KSh'),
  kgs('KGS', 'Kyrgyzstani Som', 'с'),
  kzt('KZT', 'Kazakhstani Tenge', '₸'),
  mad('MAD', 'Moroccan Dirham', 'د.م.'),
  mdl('MDL', 'Moldovan Leu', 'L'),
  mxn('MXN', 'Mexican Peso', 'Mex\$'),
  myr('MYR', 'Malaysian Ringgit', 'RM'),
  ngn('NGN', 'Nigerian Naira', '₦'),
  npr('NPR', 'Nepalese Rupee', 'रु'),
  nzd('NZD', 'New Zealand Dollar', 'NZ\$'),
  php('PHP', 'Philippine Peso', '₱'),
  pkr('PKR', 'Pakistani Rupee', '₨'),
  pln('PLN', 'Polish Złoty', 'zł'),
  qar('QAR', 'Qatari Riyal', 'ر.ق'),
  ron('RON', 'Romanian Leu', 'lei'),
  rsd('RSD', 'Serbian Dinar', 'дин'),
  sar('SAR', 'Saudi Riyal', 'ر.س'),
  sek('SEK', 'Swedish Krona', 'kr'),
  sgd('SGD', 'Singapore Dollar', 'S\$'),
  thb('THB', 'Thai Baht', '฿'),
  tjs('TJS', 'Tajikistani Somoni', 'SM'),
  zar('ZAR', 'South African Rand', 'R'),
  uyu('UYU', 'Uruguayan Peso', '\$U'),
  chf('CHF', 'Swiss Franc', 'CHF'),
  nok('NOK', 'Norwegian Krone', 'kr'),
  gbp('GBP', 'British Pound Sterling', '£');

  final String code;
  final String name;
  final String symbol;

  const Currency(this.code, this.name, this.symbol);

  @override
  String toString() => '$name ($symbol)';
}
