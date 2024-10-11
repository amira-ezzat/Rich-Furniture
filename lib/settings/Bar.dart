import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Home.dart';
import '../product/ProductCategory/categories_screen.dart';
import 'about.dart';
import 'contact.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage('assets/image/ll.jpg'),
          width: 66, // عرض الصورة
          height: 88, // ارتفاع الصورة
        ),
        const Spacer(),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem('الرئيسية', context),
            const SizedBox(width: kIsWeb ? 28 : 12),
            _buildNavItem('حول', context),
            const SizedBox(width: kIsWeb ? 28 : 12),
            _buildNavItem('المنتجات', context),
            const SizedBox(width: kIsWeb ? 28 : 12),
            _buildNavItem('تواصل معنا', context),
          ],
        ),
        SizedBox(
          width: 22.w,
        )
      ],
    );
  }

  Widget _buildNavItem(String text, BuildContext context) {
    return InkWell(
      onTap: () {
        if (text == 'الرئيسية') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (text == 'المنتجات') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FurnitureCategoriesPage()),
          );
        } else if (text == 'تواصل معنا') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()),
          );
        } else if (text == 'حول') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
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
