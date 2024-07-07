import 'package:flutter/material.dart';
import 'pages/cart.dart';
import 'pages/catalog.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 6: State Management",
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.blue,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (context) => const CatalogPage(),
        "/cart": (context) => const CartPage(),
      },
    );
  }
}
