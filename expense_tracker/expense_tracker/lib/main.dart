import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/expense_screen.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  bool isDark = false;

  void changeTheme(){
    setState((){
      isDark = !isDark;
    });
  }

 @override
 Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Expense Tracker',
    themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

    theme: ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF5B4BDB),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5FA),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF5B4BDB),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B4BDB),
          foregroundColor: Colors.white, 
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),   
    ),

    darkTheme: ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8B7CFF),
        brightness: Brightness.dark,
      ),

      scaffoldBackgroundColor: const Color(0xFF15131D),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF292442),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF24212F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
     
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B7CFF),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
     ),
      
      cardTheme: CardThemeData(
        color: const Color(0xFF24212F),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    home: ExpenseScreen(
      isDark: isDark,
      changeTheme: changeTheme,
    ),
  );
 }

}
  