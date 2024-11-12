import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/Home.dart';
import '../home/gridscreen.dart';
import '../home/screens/categoryList.dart';
import '../home/screens/furnHome/DataFurnHome.dart';
import '../home/screens/officeHome/DataOfficeHome.dart';
import '../home/screens/outHome/DataOutHome.dart';
import '../home/screens/storgHome/DataStorgHome.dart';
import '../settings/new.dart';
import '../product/ProductData/dataDetails_model.dart';
import '../product/ProductData/data_screen.dart';
import '../product/ProductDetails/details_model.dart'; // تأكد من استيراد الملف الذي يحتوي على تعريف Product


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final List<Product> products;

  final String title;

  const CustomAppBar({
    super.key,
    required this.products,
    required this.title,
  });
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            void navigateToProductList(String title, List<Product> products) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    products: products,
                    title: title,
                  ),
                ),
              );
            }

          },
          child: const Image(
            image: AssetImage('assets/image/ll.jpg'),
            width: 66,
            height: 88,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem('الاثاث', context, furnitureProducts),
            SizedBox(width: screenWidth > 600 ? 33 : 12),
            _buildNavItem('وحدات تخزين', context, unitStorageProducts),
            SizedBox(width: screenWidth > 600 ? 33 : 12),
            _buildNavItem('اثاث مكتبي', context, furnitureOfficeProducts),
            SizedBox(width: screenWidth > 600 ? 33 : 12),
            _buildNavItem('اثاث خارجي', context, furnitureOutProducts),
            SizedBox(width: screenWidth > 600 ? 33 : 12),
          ],
        ),
        SizedBox(
          width: 22.w,
        )
      ],
    );
  }

  Widget _buildNavItem(String text, BuildContext context, List<Product> products) {
    return InkWell(
      onTap: () {
        if (text == 'الاثاث') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataFurnHome( products: products, title: text,)),
          );
        } else if (text == 'وحدات تخزين') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataStorgHome( products: products, title: text,)),
          );
        }
        else if (text == 'اثاث مكتبي')
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataOfficeHome( products: products, title: text,)),
          );
        }else if (text == 'اثاث خارجي')
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataOutHome( products: products, title: text,)),
          );
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'arb',
          fontWeight: FontWeight.bold,
          color: Color(0xFF964B00),
          fontSize: 20,
        ),
      ),
    );
  }
}
