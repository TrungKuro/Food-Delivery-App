import 'package:food_delivery_app/models/food.dart';

class CartItem {
  /* ------------------------------- Variable ------------------------------ */

  Food food;
  List<Addon> selectedAddons;
  int quantity;

  /* ----------------------------------------------------------------------- */

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  /* -------------------------------- GETTER ------------------------------- */

  double get totalPrice {
    double addonPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);

    return (food.price + addonPrice) * quantity;
  }
}
