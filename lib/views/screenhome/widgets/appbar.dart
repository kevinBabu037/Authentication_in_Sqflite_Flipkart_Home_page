import 'package:flipkart_home/core/height_width.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: Image.network(
        'https://logos-world.net/wp-content/uploads/2020/11/Flipkart-Logo.png',
        height: 60,
      ),
      actions: [
        const Icon(Icons.mobile_friendly_outlined),
        kWidth10,
        const Icon(Icons.person_outlined),
        kWidth10,
        const Text("Login"),
        kWidth10,
        const Icon(Icons.shopping_cart_outlined),
        kWidth10,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}