import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('test'),
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
