import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Types of providers
    //Provider
    //ChangeNotifierProvider
    //FutureProvider
    //Stream Provider
    // print(Provider.of<String>(context));
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItems = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItems['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete),color: Colors.red,),
            title: Text(
              cartItems['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItems['size']}'),
          );
        },
      ),
    );
  }
}
