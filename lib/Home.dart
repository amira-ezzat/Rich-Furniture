import 'package:carousel_slider/carousel_slider.dart'
    as carousel_slider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rich_furniture/settings/Bar.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> imgList = [
  'https://www.kabbanifurniture.com/cdn/shop/files/1_53eaf698-fb62-4092-bb0c-46f3c049357f_1800x1800.jpg?v=1721811554',
  'https://www.kabbanifurniture.com/cdn/shop/products/tokyo-master_1800x1800.jpg?v=1647010896',
  'https://www.kabbanifurniture.com/cdn/shop/files/1_adc9ca0e-4a9a-4fc3-9789-ec3ef9216f9e_1800x1800.jpg?v=1710240473',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            carousel_slider.CarouselSlider(
              options: carousel_slider.CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imgList
                  .map((item) => Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: kIsWeb ? 200 : 90),
            Wrap(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              direction: screenWidth > 600 ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 30,
              spacing: screenWidth > 600 ? 300 : 30,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'خصومات',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontSize: kIsWeb ? 20 : 13,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 11),
                    Text(
                      'خصم يصل إلى 30% على جميع المنتجات. \n'
                      'صالحة حتى 30 سبتمبر 2024.',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontSize: kIsWeb ? 20 : 13,
                          color: Colors.grey.shade700),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'مواعيد العمل',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontSize: kIsWeb ? 20 : 14,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 11),
                    Text(
                      'السبت - الخميس:'
                      '\n9:00ص-8:00مً'
                      '\nالجمعة: عطلة',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontSize: kIsWeb ? 20 : 13,
                          color: Colors.grey.shade700),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'شاركنا وتواصل معنا عبر صفحاتنا \n'
                      'على وسائل التواصل الاجتماعي',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontSize: kIsWeb ? 20 : 13,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 11),
                    Wrap(
                      spacing: kIsWeb ? 8 : 0,
                      runSpacing: 4.0,
                      children: [
                        IconButton(
                          onPressed: () {
                            launch(
                                'https://www.instagram.com/riche.furniture?igsh=aGxjZDN3cjNlanE0');
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            size: kIsWeb ? 30 : 22,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launch(
                                'https://www.facebook.com/blacknaig?mibextid=LQQJ4d');
                          },
                          icon: const Icon(
                            Icons.facebook,
                            size: kIsWeb ? 33 : 22,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launch('https://wa.me/01007356351');
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            size: kIsWeb ? 30 : 22,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: kIsWeb ? 190 : 177),
            Container(
              color: const Color(0xFF964B00),
              width: double.infinity,
              height: kIsWeb ? 88 : 55,
              child: const Center(
                child: Text(
                  'جميع الحقوق محفوظة © Rich Furniture 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'arb',
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
