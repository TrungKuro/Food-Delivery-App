import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  /* ------------------------------- Variable ------------------------------ */

  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  /* ----------------------------------------------------------------------- */

  FoodPage({
    super.key,
    required this.food,
  }) {
    // Initialize selected Addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  /* ----------------------------------------------------------------------- */

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  /* ------------------------------- Function ------------------------------ */

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // Close the current FoodPage to go back to menu
    Navigator.pop(context);
    // Format the selected addons
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    // Add to cart
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  /* ----------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SCAFFOLD UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // FOOD IMAGE
                Image.asset(widget.food.imagePath),
                // ...
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FOOD NAME
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      // FOOD PRICE
                      Text(
                        '\$${widget.food.price.toString()}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // FOOD DESCRIPTION
                      Text(widget.food.description),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10),
                      // ADDONS
                      Text(
                        'Add-ons',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // Get individual Addon
                            Addon addon = widget.food.availableAddons[index];
                            // Return checkbox UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // BUTTON -> ADD TO CART
                MyButton(
                  onTap: () => addToCart(
                    widget.food,
                    widget.selectedAddons,
                  ),
                  text: 'Add to cart',
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        // BACK BUTTON
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
