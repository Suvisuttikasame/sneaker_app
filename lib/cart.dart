import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('test'),
              subtitle: Text('sub test'),
              leading: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/nike-1.png'),
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
