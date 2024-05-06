import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_title.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // APP LOGO
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // HOME LIST TITLE
          MyDrawerTitle(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          // SETTINGS LIST TITLE
          MyDrawerTitle(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              // Quay lại trang HomePage
              Navigator.pop(context);
              // Và chuyển sang trang SettingsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          // LOGOUT LIST TITLE
          const Spacer(),
          MyDrawerTitle(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: () {},
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
