import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cart[index]['name']),
              subtitle: Text('size ${cart[index]['size']}'),
              leading: CircleAvatar(
                backgroundImage: ExactAssetImage(cart[index]['img']),
              ),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Delete selected Item',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content:
                              const Text('Are you sure to delete this item ?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'cancel',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeProduct(cart[index]);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'ok',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
