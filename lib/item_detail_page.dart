import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/cart_provider.dart';

class ItemDetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String img;
  final List<int> sizes;

  const ItemDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.sizes,
  });

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Image.asset(
              widget.img,
              width: 300,
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              color: const Color.fromRGBO(216, 240, 253, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.price,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.sizes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = widget.sizes[index];
                                });
                              },
                              child: Chip(
                                backgroundColor:
                                    selectedSize == widget.sizes[index]
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.white,
                                label: Text(
                                  widget.sizes[index].toString(),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (selectedSize != 0) {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).addProduct({
                            'name': widget.name,
                            'price': widget.price,
                            'img': widget.img,
                            'size': selectedSize,
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 10,
                      ),
                      icon: const Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
