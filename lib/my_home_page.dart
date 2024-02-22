import 'package:flutter/material.dart';
import 'package:sneaker_app/item_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> brand = const [
    'All',
    'Addidas',
    'Nike',
    'Puma',
  ];
  final List<Map<String, dynamic>> items = [
    {'name': 'NIKE AIR 2008', 'price': 199, 'img': 'assets/images/nike-1.png'},
    {'name': 'NIKE AIR 2002', 'price': 199, 'img': 'assets/images/nike-2.png'},
    {'name': 'PUMA CITY', 'price': 199, 'img': 'assets/images/puma-1.png'},
    {'name': 'ADDIDAS X', 'price': 199, 'img': 'assets/images/addidas-1.png'},
  ];
  late String selectedBrand;

  @override
  void initState() {
    super.initState();
    selectedBrand = brand[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(119, 119, 119, 1)),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brand.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBrand = brand[index];
                          });
                        },
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          side: const BorderSide(
                              color: Color.fromRGBO(243, 243, 255, 0.8)),
                          backgroundColor: selectedBrand == brand[index]
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(243, 243, 255, 0.8),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          label: Text(brand[index]),
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      name: items[index]['name'],
                      price: '\$ ${items[index]['price']}',
                      img: items[index]['img'],
                      bgColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(243, 243, 255, 0.8),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
