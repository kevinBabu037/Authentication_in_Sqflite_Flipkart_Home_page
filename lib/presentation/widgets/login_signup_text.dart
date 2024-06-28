

import 'package:flipkart_home/presentation/core/height_width.dart';
import 'package:flipkart_home/presentation/core/styles.dart';
import 'package:flutter/material.dart';



class LoginSignUpHedingWidget extends StatelessWidget {
 const  LoginSignUpHedingWidget({
    super.key,
     required this.title,  
     required this.text,
     this.hightFromTop=50,
     this.crossAxisAlignment=CrossAxisAlignment.start

  });
  final String title;
  final String text;
  final double hightFromTop;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment:crossAxisAlignment, 
      children: [
    SizedBox(height:hightFromTop),
     Text(title,style:kLoginSingnupHeding),  
    kHeight10,
     Text(text,style:const TextStyle(fontSize: 17),), 
    kHeight30
      ],
    );
  }
}