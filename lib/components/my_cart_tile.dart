import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  /* ------------------------------- Variable ------------------------------ */

  final CartItem cartItem;

  /* ----------------------------------------------------------------------- */

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  /* ----------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FOOD IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // NAME AND PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FOOD NAME
                        Text(cartItem.food.name),
                        // FOOD PRICE
                        Text(
                          '\$${cartItem.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // INCREMENT OF DECREMENT QUANTITY
                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onDecrement: () => restaurant.removeFromCart(cartItem),
                    onIncrement: () => restaurant.addToCart(cartItem.food, cartItem.selectedAddons),
                  ),
                ],
              ),
            ),
            // ADDONS
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(bottom: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // ADDON NAME
                              Text(addon.name),
                              // ADDON PRICE
                              Text(' (\$${addon.price})'),
                            ],
                          ),
                          onSelected: (value) {},
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
