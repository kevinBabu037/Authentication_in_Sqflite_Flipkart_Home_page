import 'package:flipkart_home/core/images.dart';
import 'package:flutter/material.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)) 
          ),
            height: 260   , 
          width: 100,
          child: Column(
            children: [
              SizedBox( 
                  height: 140,  
                child: Image.network(
                  productImages[index],
                  fit: BoxFit.cover,
                ), 
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Product ${index+1}',style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
               const Align(
                alignment: Alignment.topLeft,
                child: Text('Discount 15% ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),))
            ],
          ),
        );
      },
      itemCount: productImages.length,
    );
  }
}

