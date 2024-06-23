import 'package:flipkart_home/core/height_width.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 2.2 ,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 65,
                width: 80 ,
                child: index % 2 == 0
                    ? Image.network(
                        'https://suprememobiles.in/cdn/shop/files/mobiles.jpg?crop=center&height=2048&v=1664280076&width=2048',
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://media.product.which.co.uk/prod/images/original/22a475e555d7-best-laptop-deals.jpg',
                        fit: BoxFit.cover,
                      ),
              ),
              Text('Categorie ${index+1}',style:const TextStyle(fontSize: 11),)
            ],
          );
        },
        separatorBuilder: (context, index) => kWidth10,
        itemCount: 10,
      ),
    );
  }
}
