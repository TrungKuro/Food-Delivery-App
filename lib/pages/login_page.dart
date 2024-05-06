import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ----------------------------- Top App ----------------------------- */
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      /* ---------------------------- Bottom App --------------------------- */
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
