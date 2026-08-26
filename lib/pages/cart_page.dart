import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

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
    // final cart = (Provider.of<CartProvider>(context).cart);
    //this and the above line does the same job
    final cart = context
        .watch<CartProvider>()
        .cart; //watch means continously listening // listen : false means read
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
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text('Are you sure to delete the product ? '),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(
                              cartItems,
                            ); // listen false means read ,write means continously listening ,read is just read at once and leave it
                            //this and the below line code is does same stuff
                            // Provider.of<CartProvider>(context,listen: false).removeProduct(cartItems);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
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
