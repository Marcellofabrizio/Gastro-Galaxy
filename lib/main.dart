import 'package:flutter/material.dart';
import 'package:gastro_galaxy/config/app_styles.dart';
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/pages/home.dart';
import 'package:gastro_galaxy/pages/ingredients.dart';
import 'package:gastro_galaxy/pages/recipes.dart';
import 'package:gastro_galaxy/pages/recipes_detail.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var db = Repository();

  final ThemeData myTheme = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: AppStyles.primaryColor,
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const Home(),
          );
        } else if (settings.name == "/ingredients") {
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const Ingredients(),
          );
        }
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const Home(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
      routes: {
        '/': (contex) => const Home(),
        '/ingredients': (contex) => const Ingredients(),
        '/recipes': (contex) => const Recipes(),
      },
      initialRoute: '/',
    );
  }

  @override
  void initState() {
    super.initState();
    // testInsertData();
  }
}
