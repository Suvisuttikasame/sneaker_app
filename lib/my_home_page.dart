import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(119, 119, 119, 1)),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
      )),
    );
  }
}
