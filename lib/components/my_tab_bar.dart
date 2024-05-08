import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  /* ------------------------------- Variable ------------------------------ */

  final TabController tabController;

  /* ------------------------------- Function ------------------------------ */

  /// Tạo danh sách Tab các Category món ăn
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  /* ----------------------------------------------------------------------- */

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  /* ----------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
