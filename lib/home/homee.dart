import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_furniture/home/screens/furnHome/DataFurnHome.dart';
import 'package:rich_furniture/home/screens/officeHome/DataOfficeHome.dart';
import 'package:rich_furniture/home/screens/outHome/DataOutHome.dart';
import 'package:rich_furniture/home/screens/storgHome/DataStorgHome.dart';

import '../product/ProductData/dataDetails_model.dart';
import '../product/ProductData/data_screen.dart';

class FurnHomeCard extends StatelessWidget {
  final String title;
  final String image;
  final List<Product>? products;

  const FurnHomeCard({
    super.key,
    required this.title,
    required this.image,
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (title == '      الأثاث') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DataFurnHome(
                products: products!,
                title: title,
              ),
            ),
          );
        }
        else if (title ==  '  وحدات تخزين') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DataStorgHome(
                    products: products!,
                    title: title,
                  ),
            ),
          );
        }
        else if (title == '  اثاث مكتبي') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DataOfficeHome(
                    products: products!,
                    title: title,
                  ),
            ),
          );
        }
        else if (title == '  اثاث خارجي') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DataOutHome(
                    products: products!,
                    title: title,
                  ),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:width >600?99: 77,
            height:screenHeight>600?99: 77,
            decoration: BoxDecoration(
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}