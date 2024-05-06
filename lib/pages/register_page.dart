import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  /* ------------------------------- Variable ------------------------------ */

  final void Function()? onTap;

  /* ----------------------------------------------------------------------- */

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  /* ----------------------------------------------------------------------- */

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /* ------------------------------- Variable ------------------------------ */

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
              "Let's create an account for you",
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
            const SizedBox(height: 10),
            // CONFIRM PASS (TEXTFIELD)
            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
            // SIGN UP (BUTTON)
            MyButton(
              onTap: () {},
              text: 'Sign Up',
            ),
            const SizedBox(height: 25),
            // Already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap, //!
                  child: Text(
                    'Login now',
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
