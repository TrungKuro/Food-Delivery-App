import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ----------------------------- Top App ----------------------------- */
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: const MyDrawer(),
      /* ----------------------------- Body App ---------------------------- */
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
