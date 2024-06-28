import 'package:flipkart_home/presentation/widgets/login_signup_button.dart';
import 'package:flutter/material.dart';

class SignUpLoadingWidget extends StatelessWidget {
  const SignUpLoadingWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return const Stack(
       children: [
         LoginSignUpButtonWidget(
                     text: 'Sign Up',
                     ),
                     Center(child: CircularProgressIndicator())
       ],
     );
  }
}