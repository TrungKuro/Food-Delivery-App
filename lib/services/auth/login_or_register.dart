import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  /* ------------------------------- Variable ------------------------------ */

  /// Lần khởi tạo ứng dụng đầu tiên, mặc định vào trang LoginPage
  bool showLoginPage = true;

  /// Thực hiện đổi qua lại giữa trang LoginPage và RegisterPage
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  /* ----------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(
            onTap: togglePages,
          )
        : RegisterPage(
            onTap: togglePages,
          );
  }
}
