
import 'package:flipkart_home/core/height_width.dart';
import 'package:flutter/material.dart';

class ProductsRowWidget extends StatelessWidget {
  const ProductsRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: index % 2 == 0
                    ? Image.network(
                        'https://t4.ftcdn.net/jpg/06/56/49/89/360_F_656498974_hkbZmIZkCZaiol4thr5Eu4ebmwJ7NsVH.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://cdn.thewirecutter.com/wp-content/media/2023/09/noise-cancelling-headphone-2048px-0876.jpg',
                        fit: BoxFit.cover,
                      ),
              ),
              Text(
                'Product ${index + 1}',
                style: const TextStyle(fontSize: 16),
              ),
              const Text(
                'From ₹ 200',
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => kWidth10,
        itemCount: 10,
      ),
    );
  }
}
