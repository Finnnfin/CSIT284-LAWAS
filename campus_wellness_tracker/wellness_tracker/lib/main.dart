
import 'package:flutter/material.dart';
import 'package:wellness_tracker/screens/home_screen.dart';
import 'package:wellness_tracker/theme_controller.dart';

void main() {
  runApp(const WellnessTrackerApp());
}

class WellnessTrackerApp extends StatelessWidget {
  const WellnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeMode,
      builder: (context, mode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wellness Tracker App',
          themeMode: mode,

          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7952B3),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: const Color(0xFFF7F4FC),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFF7F4FC),
              foregroundColor: Color(0xFF302044),
              elevation: 0,
              centerTitle: false,
            ),
            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFFEAE2F4)),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7952B3),
                foregroundColor: Colors.white,
                minimumSize: const Size(48, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFB99AE8),
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF17121F),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF17121F),
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
            ),
            cardTheme: CardThemeData(
              color: const Color(0xFF251D31),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFF3A2C4B)),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B78D0),
                foregroundColor: Colors.white,
                minimumSize: const Size(48, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          home: const HomeScreen(),
        );
      },
    );
  }
}
