import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/pages/detailed_page.dart';
import 'package:wordy/pages/homepage.dart';
import 'package:wordy/pages/search_page.dart';
import 'package:wordy/provider/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightScheme, ColorScheme? darkDynamic) {
        return ChangeNotifierProvider(
          create: (context) => AppState(),
          child: MaterialApp(
            routes: {
              '/search': (context) => const SearchPage(),
              '/detailed': (context) => const DetailedPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Wordy',
            theme: ThemeData(
              colorScheme: lightScheme,
              brightness: Brightness.light,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkDynamic,
              // colorSchemeSeed: Colors.blue[300],
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            themeMode: ThemeMode.system,
            home: const HiddenDrawerWidget(),
          ),
        );
      },
    );
  }
}
