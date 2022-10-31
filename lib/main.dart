import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/favourites/fav_page.dart';
import 'package:provider_app/favourites/login.dart';
import 'package:provider_app/favourites/theme_page.dart';
import 'package:provider_app/favourites/value_notiier.dart';
import 'package:provider_app/homepage.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider_app/provider/fav_provider.dart';
import 'package:provider_app/provider/login_provider.dart';
import 'package:provider_app/provider/slider_provider.dart';
import 'package:provider_app/provider/theme_provider.dart';
import 'package:provider_app/screens/count_ex.dart';
import 'package:provider_app/screens/slider_ex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginApiProvider()),
      ],
      child: Builder(
        builder: ((context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.teal,
            ),
            initialRoute: '/loginApiScreen',
            home: HomePage(),
            routes: {
              '/countexample': (context) => const CountExample(),
              '/sliderexample': (context) => const SliderExampler(),
              '/favoriteScreen': (context) => const FavoriteScreens(),
              '/themePage': (context) => const ThemePage(),
              '/valueNotifier': (context) => ValueNotifierScreen(),
              '/loginApiScreen': (context) => LoginApiScreen(),
            },
          );
        }),
      ),
    );
  }
}
