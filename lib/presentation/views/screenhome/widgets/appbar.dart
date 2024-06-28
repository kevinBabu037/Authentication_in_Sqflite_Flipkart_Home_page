import 'package:flipkart_home/data/shared_prefrenses/shared_prefrenses.dart';
import 'package:flipkart_home/presentation/core/functions_navigations.dart';
import 'package:flipkart_home/presentation/core/height_width.dart';
import 'package:flipkart_home/presentation/views/allusers/all_users.dart';
import 'package:flipkart_home/presentation/views/authentication/login/screen_login.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  IconButton(icon:const Icon(Icons.menu) ,
      onPressed: (){
         kNavigationPush(context,const ScreenAllUsers());
      },),
      title: Image.network(
        'https://logos-world.net/wp-content/uploads/2020/11/Flipkart-Logo.png',
        height: 60,
      ),
      actions: [
        const Icon(Icons.mobile_friendly_outlined),
        kWidth10,
        const Icon(Icons.person_outlined),
        kWidth10,
        GestureDetector(
          onTap: ()async {
           await SharedPreferenses.deleteBool();
           // ignore: use_build_context_synchronously
           kNavigationPushReplacement(context, ScreenLogIn()); 
          },
          child: const Text("Login")),
        kWidth10,
        const Icon(Icons.shopping_cart_outlined),
        kWidth10,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}