import 'package:flutter/material.dart';

import '../../../common/widgets/stars.dart';
import '../../../models/product.dart';

class SearchProduct extends StatelessWidget {
  final Product product;
  const SearchProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double averageRating = 0;

    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    if(totalRating!=0){
      averageRating = totalRating/product.rating!.length;
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top:5),
                    child:  Stars(rating: averageRating),
                  ),

                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top:5),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                          fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),

                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Eligible for FREE Shipping",
                    ),
                  ),

                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top:5),
                    child: const Text(
                      ' In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
