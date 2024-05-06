import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ----------------------------- Top App ----------------------------- */
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      /* ----------------------------- Body App ---------------------------- */
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // SWITCH DARK MODE
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(
              top: 10,
              left: 25,
              right: 25,
            ),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // DARK MODE
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                // SWITCH
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                  activeColor: Colors.amber, //!
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
