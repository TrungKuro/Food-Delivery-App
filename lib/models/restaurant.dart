import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  /// Danh sách menu các món ăn
  final List<Food> _menu = [
    // Burgers
    Food(
      name: 'Classic Cheese Burger',
      description: 'A juicy beef party with melted cheddar, lettice, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/burger_1.jpeg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocafo', price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description:
          'A mouthwatering beef patty topped with crispy bacon, melted cheddar cheese, tangy barbecue sauce, lettuce, tomato, and onion, all nestled between toasted buns.',
      imagePath: 'lib/images/burgers/burger_2.jpeg',
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Bacon', price: 1.99),
        Addon(name: 'Fried Onion Rings', price: 2.49),
        Addon(name: 'Jalapeno Peppers', price: 0.99),
      ],
    ),
    Food(
      name: 'Aloha Burger',
      description:
          'A tropical twist on the classic burger, featuring a juicy beef patty topped with grilled pineapple, crispy bacon, melted Swiss cheese, lettuce, tomato, and tangy teriyaki sauce, all served on a toasted bun.',
      imagePath: 'lib/images/burgers/burger_3.jpeg',
      price: 11.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Pineapple', price: 1.49),
        Addon(name: 'Grilled Ham', price: 2.99),
        Addon(name: 'Coconut Shavings', price: 0.99),
      ],
    ),
    Food(
      name: 'Blue Moon Burger',
      description:
          'An indulgent creation featuring a succulent beef patty topped with creamy blue cheese, caramelized onions, crispy bacon, tangy barbecue sauce, lettuce, and tomato, all sandwiched between a toasted brioche bun.',
      imagePath: 'lib/images/burgers/burger_4.jpeg',
      price: 12.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Blue Cheese', price: 1.99),
        Addon(name: 'Portobello Mushrooms', price: 2.49),
        Addon(name: 'Truffle Aioli', price: 3.99),
      ],
    ),

    // Salads
    Food(
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce topped with parmesan cheese, crunchy croutons, and Caesar dressing.',
      imagePath: 'lib/images/salads/salad_1.jpeg',
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Shrimp', price: 3.99),
        Addon(name: 'Avocado', price: 1.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'A refreshing combination of crisp lettuce, juicy tomatoes, cucumbers, red onions, tangy olives, and creamy feta cheese, dressed with olive oil and herbs.',
      imagePath: 'lib/images/salads/salad_2.jpeg',
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Gyro Meat', price: 3.99),
        Addon(name: 'Hummus', price: 1.99),
      ],
    ),
    Food(
      name: 'Quinoa Salad',
      description:
          'A nutritious blend of fluffy quinoa, colorful bell peppers, crisp cucumbers, sweet cherry tomatoes, creamy avocado, and tangy lime vinaigrette.',
      imagePath: 'lib/images/salads/salad_3.jpeg',
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Tofu', price: 2.99),
        Addon(name: 'Roasted Chickpeas', price: 1.99),
        Addon(name: 'Feta Cheese', price: 1.99),
      ],
    ),
    Food(
      name: 'Asian Sesame Salad',
      description:
          'A flavorful mix of crunchy cabbage, shredded carrots, crisp snow peas, sliced almonds, and sesame seeds tossed in a tangy sesame-ginger dressing.',
      imagePath: 'lib/images/salads/salad_4.jpeg',
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Shrimp', price: 3.99),
        Addon(name: 'Sliced Chicken', price: 2.99),
        Addon(name: 'Edamame', price: 1.49),
      ],
    ),

    // Sides
    Food(
      name: 'Onion Rings',
      description:
          'Crispy golden onion rings coated in a flavorful batter, served hot and crunchy for the perfect side dish or snack.',
      imagePath: 'lib/images/sides/sides_1.jpeg',
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Spicy Ranch Dip', price: 0.99),
        Addon(name: 'Garlic Aioli', price: 0.99),
        Addon(name: 'Sweet Chili Sauce', price: 0.99),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description:
          'Warm slices of toasted bread brushed with garlic-infused butter and sprinkled with aromatic herbs, perfect for dipping in marinara sauce or enjoying on its own.',
      imagePath: 'lib/images/sides/sides_2.jpeg',
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese Dip', price: 0.99),
        Addon(name: 'Pesto Sauce', price: 0.99),
        Addon(name: 'Balsamic Glaze', price: 0.99),
      ],
    ),
    Food(
      name: 'Sweet Potato Fries',
      description:
          'Crispy sweet potato fries lightly seasoned with salt and pepper, served hot and golden brown for a deliciously satisfying side dish or snack.',
      imagePath: 'lib/images/sides/sides_3.jpeg',
      price: 5.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Chipotle Aioli', price: 0.99),
        Addon(name: 'Honey Mustard Dip', price: 0.99),
        Addon(name: 'Maple Syrup Drizzle', price: 0.99),
      ],
    ),
    Food(
      name: 'Crispy Mac & Cheese Bites',
      description:
          'Irresistible bites of creamy macaroni and cheese coated in crispy breadcrumbs, fried to perfection, and served hot for a mouthwatering appetizer or side dish.',
      imagePath: 'lib/images/sides/sides_4.jpeg',
      price: 6.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Spicy Marinara Dip', price: 0.99),
        Addon(name: 'Truffle Aioli', price: 0.99),
        Addon(name: 'Honey Sriracha Sauce', price: 0.99),
      ],
    ),

    // Desserts
    Food(
      name: 'Chocolate Brownie',
      description:
          'A decadent chocolate brownie made with rich cocoa, topped with a scoop of creamy vanilla ice cream, drizzled with warm chocolate sauce, and finished with a sprinkle of chopped nuts.',
      imagePath: 'lib/images/desserts/desserts_1.jpeg',
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Ice Cream Scoop', price: 1.99),
        Addon(name: 'Caramel Sauce', price: 0.99),
        Addon(name: 'Whipped Cream', price: 0.49),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description:
          'A classic dessert made with tender, flaky pastry crust filled with sweet cinnamon-spiced apples, baked until golden brown and served warm with a scoop of vanilla ice cream.',
      imagePath: 'lib/images/desserts/desserts_2.jpeg',
      price: 8.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Caramel Drizzle', price: 0.99),
        Addon(name: 'Whipped Cream', price: 0.49),
        Addon(name: 'Crushed Walnuts', price: 0.99),
      ],
    ),
    Food(
      name: 'Red Velvet Lava Cake',
      description:
          'Indulge in this decadent dessert featuring a moist red velvet cake with a molten chocolate center, served warm and topped with a dusting of powdered sugar and a scoop of vanilla ice cream.',
      imagePath: 'lib/images/desserts/desserts_3.jpeg',
      price: 9.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Raspberry Sauce', price: 1.49),
        Addon(name: 'Chocolate Shavings', price: 0.99),
        Addon(name: 'Whipped Cream', price: 0.49),
      ],
    ),
    Food(
      name: 'Cheese Cake',
      description:
          'Savor the creamy goodness of this classic dessert made with a velvety smooth cheesecake filling on a buttery graham cracker crust, topped with your choice of fruit compote or chocolate ganache.',
      imagePath: 'lib/images/desserts/desserts_4.jpeg',
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Mixed Berry Compote', price: 1.49),
        Addon(name: 'Chocolate Ganache', price: 1.99),
        Addon(name: 'Whipped Cream', price: 0.49),
      ],
    ),

    // Drinks
    Food(
      name: 'Lemonade',
      description:
          'Refreshing lemonade made with freshly squeezed lemons, pure cane sugar, and ice, served chilled for a burst of citrus flavor.',
      imagePath: 'lib/images/drinks/drink_1.jpeg',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Mint Leaves', price: 0.49),
        Addon(name: 'Strawberry Slices', price: 0.99),
        Addon(name: 'Raspberry Syrup', price: 0.99),
      ],
    ),
    Food(
      name: 'Iced Tea',
      description:
          'Cool off with our refreshing iced tea made from freshly brewed tea leaves, sweetened to perfection, and served over ice for a crisp and revitalizing drink.',
      imagePath: 'lib/images/drinks/drink_2.jpeg',
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Lemon Wedge', price: 0.29),
        Addon(name: 'Peach Syrup', price: 0.99),
        Addon(name: 'Mint Leaves', price: 0.49),
      ],
    ),
    Food(
      name: 'Smoothie',
      description:
          'A refreshing and nutritious blend of fresh fruits, yogurt, and ice, blended together to create a creamy and delicious smoothie bursting with flavor.',
      imagePath: 'lib/images/drinks/drink_3.jpeg',
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Protein Powder', price: 1.49),
        Addon(name: 'Spinach', price: 0.99),
        Addon(name: 'Chia Seeds', price: 0.79),
      ],
    ),
    Food(
      name: 'Mojito',
      description:
          'Enjoy the refreshing taste of our classic Mojito, made with fresh mint leaves, lime wedges, white rum, soda water, and a touch of simple syrup, served over ice for a cool and invigorating drink.',
      imagePath: 'lib/images/drinks/drink_4.jpeg',
      price: 7.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Lime Wedge', price: 0.29),
        Addon(name: 'Cucumber Slices', price: 0.99),
        Addon(name: 'Raspberry Puree', price: 0.79),
      ],
    ),
  ];

  /* -------------------------------- GETTER ------------------------------- */

  /// Lấy data các món ăn
  List<Food> get menu => _menu;

  /* -------------------------------- SETTER ------------------------------- */

  /* ------------------------------ OPETATION ------------------------------ */

  /// User Cart
  final List<CartItem> _cart = [];

  /// Add to Cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // See if there is a Cart item already with the same food and selected addons
    CartItem? carItem = _cart.firstWhereOrNull((item) {
      // Check if the food items are the same
      bool isSameFood = item.food == food;
      // Check if the list of selected addons are the same
      bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // If item already exists, increase it's quantity
    if (carItem != null) {
      carItem.quantity++;
    }
    // Otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(
        food: food,
        selectedAddons: selectedAddons,
      ));
    }
    // Update UI
    notifyListeners();
  }

  /// Remove from Cart
  void removeFromCart(CartItem cardItem) {
    // Find that item in list cart
    int carIndex = _cart.indexOf(cardItem);
    // If have, then check quantity
    if (carIndex != 1) {
      // If quantity have more one, then decrease it
      if (_cart[carIndex].quantity > 1) {
        _cart[carIndex].quantity--;
      }
      // Otherwise, remove that item from cart
      else {
        _cart.removeAt(carIndex);
      }
      // Update UI
      notifyListeners();
    }
  }

  /// Get total Price of Cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  /// Get total Number of Items in Cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  /// Clear Cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /* -------------------------------- HELPER ------------------------------- */

  /// Generate a Receipt
  ///
  /// Format double value into money
  ///
  /// Format list of addons into a string summary
}
