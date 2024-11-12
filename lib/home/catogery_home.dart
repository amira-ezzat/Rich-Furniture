import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../product/ProductData/dataDetails_model.dart';
import '../product/ProductData/data_screen.dart';

class FurnitureCard extends StatelessWidget {
  final String title;
  final String image;
  final List<Product> products;

  const FurnitureCard({
    super.key,
    required this.title,
    required this.image,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductGridScreen(
              products: products,
              title: title,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
           //   color: ,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'arb',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}