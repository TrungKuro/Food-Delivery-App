import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  /* ------------------------------- Variable ------------------------------ */

  final Widget child;
  final Widget title;

  /* ----------------------------------------------------------------------- */

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  /* ----------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // CART BUTTON
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunset Diner'),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          top: 0,
          left: 0,
          right: 0,
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
