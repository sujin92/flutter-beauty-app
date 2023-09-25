import 'package:beauty/pages/home/home.dart';
import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
            canvasColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff633581),
                surface: Colors.white,
                background: Colors.red),
            brightness: Brightness.light,
            fontFamily: 'Pretendard',
            extensions: [
              BeautyTheme.light,
            ],
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Color(0xff333333),
              ),
            )),
        darkTheme: ThemeData(
          colorSchemeSeed: const Color(0xff633581),
          brightness: Brightness.dark,
          fontFamily: 'Pretendard',
          extensions: [
            BeautyTheme.dark,
          ],
        ),
        themeMode: ThemeMode.light,
        home: const Home(),
      ),
    );
  }
}
