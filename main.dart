import 'package:citiestest/menu.dart';
import 'package:citiestest/search_by_area.dart';
import 'package:citiestest/search_by_country.dart';
import 'package:citiestest/search_by_name.dart';
import 'package:flutter/material.dart';

import 'http_override.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/menu',
      routes: {
        '/searchbyname': (context) => const SearchByName(),
        '/searchbycountry': (context) => const SearchByCountry(),
        '/searchbyarea': (context) => const SearchByArea(),
        '/menu': (context) => const MainMenu(),
      },
    );
  }
}