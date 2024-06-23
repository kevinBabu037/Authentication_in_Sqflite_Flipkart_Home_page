import 'package:flipkart_home/views/screenhome/screen_home.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flipkart home',
      home: ScreenHome(),
    );
  }
}