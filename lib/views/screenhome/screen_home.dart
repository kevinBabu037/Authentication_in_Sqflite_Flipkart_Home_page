import 'package:flipkart_home/core/height_width.dart';
import 'package:flipkart_home/views/screenhome/widgets/appbar.dart';
import 'package:flipkart_home/views/screenhome/widgets/carousel.dart';
import 'package:flipkart_home/views/screenhome/widgets/products_grid.dart';
import 'package:flipkart_home/views/screenhome/widgets/products_row.dart';
import 'package:flipkart_home/views/screenhome/widgets/search.dart';
import 'package:flutter/material.dart';

import 'widgets/categories.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:const Color.fromARGB(255, 243, 238, 240),
      appBar: const CustomAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7 ),
          child: Column(
            children: [
              const SearchBarWidget(),
              kHeight10,
              const CategoriesWidget(),
              kHeight10,
              const CarouselWidget(),
              kHeight10,
             const ProductsRowWidget(),
             kHeight10,
             const ProductsGridWidget(),
             kHeight20 
            ],
          ),
        ),
      ),
    );
  }
}


