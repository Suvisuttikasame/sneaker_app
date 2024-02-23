import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sneaker_app/cart.dart';

import 'package:sneaker_app/item_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int currentPageIndex = 0;
  List<Widget> pages = const [
    ItemList(),
    Cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          currentIndex: currentPageIndex,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
          ]),
    );
  }
}
