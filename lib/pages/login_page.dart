import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  /* ------------------------------- Variable ------------------------------ */

  final void Function()? onTap;

  /* ----------------------------------------------------------------------- */

  const LoginPage({
    super.key,
    required this.onTap,
  });

  /* ----------------------------------------------------------------------- */

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* ------------------------------- Variable ------------------------------ */

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /* ------------------------------- Function ------------------------------ */

  /// Xử lý phần đăng nhập
  void login() async {
    // Get auth service
    final authService = AuthService();

    // Try sign in
    try {
      await authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }
    // Display any errors
    catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  /* ----------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ----------------------------- Body App ---------------------------- */
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // (LOGO)
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            // MESSAGE (SLOGAN APP)
            Text(
              'Food Delivery App',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
            // EMAIL (TEXTFIELD)
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            // PASS (TEXTFIELD)
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
            // SIGN IN (BUTTON)
            MyButton(
              onTap: login, //!
              text: 'Sign In',
            ),
            const SizedBox(height: 25),
            // Not a remember? Register now!
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a remember?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap, //!
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
