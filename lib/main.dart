import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

import 'package:genotek_test_app/src/features/price_table/presentation/price_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genotek Price List',
      theme: _buildTheme(context, false), // Material theme
      darkTheme: _buildTheme(context, true), // Dark theme
      themeMode: ThemeMode.system, // Auto-switch based on system settings
      home: const PriceScreen(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'), // Default locale
        Locale('ru', 'RU'), // Russian locale
      ],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }

  ThemeData _buildTheme(BuildContext context, bool isDark) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1.5,
      ),
      dataTableTheme: DataTableThemeData(
        horizontalMargin: 20,
        dividerThickness: 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        headingRowColor: WidgetStateProperty.all(
          isDark ? Colors.grey[800] : Colors.grey[200],
        ),
      ),
    );
  }
}
