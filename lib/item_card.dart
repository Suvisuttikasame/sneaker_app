import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String img;
  final Color bgColor;

  const ItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(price),
          Center(
            child: Image.asset(
              img,
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
