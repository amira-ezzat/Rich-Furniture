import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rich_furniture/Drawer_model/furniture/callous/dataCallous_categiry.dart';
import 'package:rich_furniture/Drawer_model/furniture/room/dataroom_category.dart';
import 'package:rich_furniture/home/screens/categoryList.dart';

import '../../../appBar/Bar.dart';
import '../../../appBar/appBarr_phone.dart';
import '../../../home/catogery_home.dart';

import '../product/ProductData/dataDetails_model.dart';

class ListHome extends StatelessWidget {
  final String title;
  final String image;
  final List<Product> products;

  const ListHome({
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
              builder: (context) => HomeListScreen(
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
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
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
