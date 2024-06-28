import 'package:flipkart_home/presentation/core/colors.dart';
import 'package:flipkart_home/presentation/core/functions_navigations.dart';
import 'package:flipkart_home/presentation/views/authentication/login/screen_login.dart';
import 'package:flutter/material.dart';

class AlredyHaveAccWidget extends StatelessWidget {
  const AlredyHaveAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
     children: [
      const Text('Already have an account?'),
       GestureDetector( 
         onTap: () {
            kNavigationPush(context, ScreenLogIn());
         },
         child: const Text(' Login',style: TextStyle(color: kClrBlue,fontSize: 16 ,fontWeight: FontWeight.bold),),
         ),
                   
     ],
       );
  }
}