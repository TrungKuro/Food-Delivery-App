import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  /* ------------------------------- Variable ------------------------------ */

  final TabController tabController;

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
      tabs: const [
        // 1st TAB
        Tab(
          child: Icon(
            Icons.home,
          ),
        ),
        // 2nd TAB
        Tab(
          child: Icon(
            Icons.settings,
          ),
        ),
        // 3rd TAB
        Tab(
          child: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }
}
