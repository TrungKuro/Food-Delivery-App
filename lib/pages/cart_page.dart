import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // Cart
        final userCart = restaurant.cart;

        // Scaffold UI
        return Scaffold(
          /* --------------------------- Top App --------------------------- */
          appBar: AppBar(
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Clear Cart Button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure you want to clear the cart?'),
                      actions: [
                        // Cancel Button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        // Yes Button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
          /* --------------------------- Body App -------------------------- */
          body: Column(
            children: [
              // List of Cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('Cart is empty...'),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // Get individual Cart item
                                final cartItem = userCart[index];
                                // Return Cart tile UI
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              // Button to Pay
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: MyButton(
                  text: 'Go to checkout',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
