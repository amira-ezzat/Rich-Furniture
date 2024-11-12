import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/Home.dart';
import '../home/screens/categoryList.dart';
import '../settings/new.dart';
import '../product/ProductData/dataDetails_model.dart';
import '../product/ProductData/data_screen.dart';
import '../product/ProductDetails/details_model.dart'; // تأكد من استيراد الملف الذي يحتوي على تعريف Product

class CustomAppBarPhone extends StatelessWidget implements PreferredSizeWidget {

  final List<Product> products;

  final String title;

  const CustomAppBarPhone({
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

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    products: products,
                    title: title,
                  ),
                ),
              );


          },
          child: const Image(
            image: AssetImage('assets/image/ll.jpg'),
            width: 66,
            height: 88,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.notes,
            color: Color(0xFF964B00),
          ),
        ),
      ],
    );
  }
}










