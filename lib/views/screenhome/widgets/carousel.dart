import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart_home/core/images.dart'; 
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 190.0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true, 
        autoPlay: true, 
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        scrollDirection: Axis.horizontal,
      ), 
      items: productsRow.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(
                i,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
