import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rich_furniture/Drawer_model/furniture/callous/dataCallous_categiry.dart';
import 'package:rich_furniture/Drawer_model/furniture/room/dataroom_category.dart';

import '../../../appBar/Bar.dart';
import '../../../appBar/appBarr_phone.dart';
import '../../../home/catogery_home.dart';

import '../product/ProductData/dataDetails_model.dart';
import 'furniture/bed/data_catogry.dart';
import '../product/ProductData/data_screen.dart';
import '../product/ProductDetails/details_model.dart';
import 'furniture/chair/dataChair_catogry.dart';
import 'furniture/kids/dataKids_category.dart';
import 'furniture/table/dataTable_category.dart';
import 'furniture/telev/dataTv_category.dart';

class FurnitureDrawer extends StatelessWidget {
  final String title;
  final String image;
  final List<Product> products;

  const FurnitureDrawer({
    super.key,
    required this.title,
    required this.image,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
      if (title == '     سرير') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataCatogryProduct(
              products: products,
              title: title,
            ),
          ),
        );
      }
      else if (title == '  كراسي') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataChairCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else if (title == '   كنب') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataCallousCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else if (title == '  ترابيزة') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataTableCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else if (title == 'ترابيزة تليفزيون') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataTableTvCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else if (title == 'غرف كاملة') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataRoomCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else if (title == 'حديثي الولادة') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DataKidCatogryProduct(
                  products: products,
                  title: title,
                ),
          ),
        );
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductGridScreen(
                  products: products,
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
