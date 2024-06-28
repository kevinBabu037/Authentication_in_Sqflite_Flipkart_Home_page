import 'package:flipkart_home/data/shared_prefrenses/shared_prefrenses.dart';
import 'package:flipkart_home/presentation/views/allusers/bloc/bloc/all_users_bloc.dart';
import 'package:flipkart_home/presentation/views/authentication/login/bloc/bloc/login_bloc.dart';
import 'package:flipkart_home/presentation/views/authentication/login/screen_login.dart';
import 'package:flipkart_home/presentation/views/authentication/signup/bloc/bloc/sign_up_bloc.dart';
import 'package:flipkart_home/presentation/views/screenhome/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flipkart_home/data/sqflite_service/sqflite.dart';

final SqfliteService sqfliteService = SqfliteService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sqfliteService.initializeDatabase();
      bool isLoggedIn = await SharedPreferenses.getBoolValue() ?? false;

  runApp( MyApp(isLogin:isLoggedIn ,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => AllUsersBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flipkart Home',
        home: isLogin?const ScreenHome() : ScreenLogIn() 
      ),
    );
  }
}
