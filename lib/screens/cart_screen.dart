import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemWidget(cart.items[i]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Total: ₹${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.green, // Change the text color to black
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
            child: Image.asset(
              'assets/${cartItem.product.imageName}',
              fit: BoxFit.cover,
              width: 70,  // Increase the width
              height: 100, // Increase the height
            ),
          ),
          title: Text(cartItem.product.name),
          subtitle: Text('₹${cartItem.product.price}'), // Change the currency symbol
          trailing: Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.decrementItem(cartItem);
                  },
                ),
                Text(cartItem.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cart.incrementItem(cartItem);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
