import 'package:flipkart_home/data/sqflite_service/sqflite.dart';
import 'package:flipkart_home/presentation/core/colors.dart';
import 'package:flipkart_home/presentation/core/functions_navigations.dart';
import 'package:flipkart_home/presentation/core/height_width.dart';
import 'package:flipkart_home/presentation/core/validation.dart';
import 'package:flipkart_home/presentation/views/authentication/login/bloc/bloc/login_bloc.dart';
import 'package:flipkart_home/presentation/views/authentication/signup/screen_signup.dart';
import 'package:flipkart_home/presentation/views/screenhome/screen_home.dart';
import 'package:flipkart_home/presentation/widgets/auth_textformfild.dart';
import 'package:flipkart_home/presentation/widgets/login_signup_button.dart';
import 'package:flipkart_home/presentation/widgets/login_signup_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLogIn extends StatelessWidget {
   ScreenLogIn({super.key});
   final SqfliteService service = SqfliteService();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController eMailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), 
        child: SingleChildScrollView(
          child: Form(
            key:formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
               const LoginSignUpHedingWidget(
                  title: 'Login',
                  text: 'Login to get started',
                ),
            
                 /////////////
                 
                    const Text('Email',style:TextStyle(color:kClrGrey),),   
                       BuildTextFormField( 
                      hintTxt:'Enter Email', 
                      prfixIcon: Icons.email_outlined, 
                      controller:eMailController ,
                      validator: (value) {
                       return validateEmail(value);
                      },
                      ),
             
                        kHeight10,
                      Align(alignment: Alignment.centerRight,  
                     child:  GestureDetector(
                      onTap: () {
                      },
                      child:const Text('Forgot Password?'))),
                     kHeight20,
                  
                    const Text('Password',style:TextStyle(color:kClrGrey),),   
                       BuildTextFormField( 
                       obscureTxt: true, 
                      hintTxt:'Enter Password',  
                      prfixIcon: Icons.lock_outlined, 
                      controller:passwordController ,
                      validator: (value) {
                        return validatePassword(value);
                      },
                      ),
                     
                     //////////////////
            
                        kHeight60, 

                     BlocConsumer<LoginBloc, LoginState>(
                       listener: (context, state) {
                         if (state is LoginSuccessState) {
                           kNavigationPushRemoveUntil(context, const ScreenHome());
                         }else{
                          kSnakBar(context, 'Invalid Email or Password', kClrRed);
                         }
                       },
                       builder: (context, state) {
                         return LoginSignUpButtonWidget( 
                              text: 'Login',  
                              onPressed: ()async{ 
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(UserLogin(email:eMailController.text,password: passwordController.text ));
                              }
                             }
                             );
                       },
                     ),
             
                     kHeight20,


            
                  Align(child: GestureDetector(  
                    onTap: () {
                       kNavigationPushReplacement(context, ScreenSignup());
                      }, 
                    child:const Text('Create Account',style: TextStyle(color: kClrBlue,fontSize: 16,fontWeight: FontWeight.bold),)
                    )),
              ],
            ),
          ), 
        ),
      ),
    );
  }
}

