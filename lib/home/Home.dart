import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rich_furniture/appBar/Bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Drawer_model/drawer.dart';
import '../Drawer_model/furniture/callous/callous.dart';
import '../Drawer_model/furniture/callous/dataCallous_categiry.dart';
import '../Drawer_model/furniture/telev/dataTv_category.dart';
import '../Drawer_model/furniture/telev/tabelTv.dart';
import '../Drawer_model/storage/unit.dart';
import '../appBar/appBarr_phone.dart';
import '../product/ProductData/dataDetails_model.dart';
import 'gridscreen.dart';
import 'homee.dart';

final List<String> imgList = [
  'https://www.kabbanifurniture.com/cdn/shop/files/1_53eaf698-fb62-4092-bb0c-46f3c049357f_1800x1800.jpg?v=1721811554',
  'https://www.kabbanifurniture.com/cdn/shop/products/tokyo-master_1800x1800.jpg?v=1647010896',
  'https://www.kabbanifurniture.com/cdn/shop/files/1_adc9ca0e4a9a-4fc3-9789-ec3ef9216f9e_1800x1800.jpg?v=1710240473',
];

class HomeScreen extends StatefulWidget {
   final List<Product> products;

   final String title;

  const HomeScreen({
    super.key,
    required this.products,
    required this.title,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

   return Scaffold(
      backgroundColor: Colors.white,
     appBar: width < 600 ?
     CustomAppBarPhone(products:widget.products,title: widget.title,) :
     CustomAppBar(products:widget.products,title: widget.title,),
      drawer: DrawScreen(),
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
            const SizedBox(height: kIsWeb ? 66 : 90),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FurnHomeCard(
                        title: '      الأثاث',
                        image:
                        'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%A7%D8%AB%D8%A7%D8%AB.jpg?alt=media&token=821b92e2-f8e3-4063-9d36-054173d0780f',
                        products: furnitureProducts,
                      ),
                      SizedBox(width:width > 600 ? 66 : 22),
                      FurnHomeCard(
                        title: '  وحدات تخزين',
                        image:
                        'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AA%D8%AE%D8%B2%D9%8A%D9%86.jpg?alt=media&token=a3086225-208a-43f3-866d-8c8b869ec095',
                        products: unitStorageProducts,
                      ),
                      SizedBox(width:width > 600 ? 66 : 22),
                      FurnHomeCard(
                        title: '  اثاث مكتبي',
                        image:
                        'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D9%85%D9%83%D8%AA%D8%A8%D9%8A.jpg?alt=media&token=fc114b2d-8d02-4b44-8a02-835e0e4acd49',
                        products: furnitureOfficeProducts,
                      ),
                       SizedBox(width:width > 600 ? 66 : 22),
                      FurnHomeCard(
                        title: '  اثاث خارجي',
                        image:
                        'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AE%D8%A7%D8%B1%D8%AC%D9%8A.jpg?alt=media&token=00cc58b8-7682-4779-95df-a445176f7b5d',
                        products: furnitureOutProducts,
                      ),

                    ],
                  ),
                ),
              ),
            const SizedBox(height: 50 ),
            Padding(
          padding: const EdgeInsets.all(8.0), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  print('Products: ${widget.products}');
                  print('Title: ${widget.title}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataTableTvCatogryProduct(
                        products: widget.products,
                        title: widget.title,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xFF964B00),
                      size: 16,
                    ),
                    Text(
                      'مشاهدة المزيد',
                      style: TextStyle(
                        color: const Color(0xFF964B00),
                        fontFamily: 'arb',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
              Text(
                'وحدات تليفزيون',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'arb',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

            ],
          ),
        ),
            if (width > 600)
              SizedBox(
                height: 370,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width < 600 ? width * 0.6 : width * 0.2, // Set width for each item
                      child: ProductTvCard(product: tableTvProducts[index]),
                    );
                  },
                ),
              )
            else
              SizedBox(
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width < 600 ? width * 0.6 : width * 0.2,
                      child: ProductCard(product: tableTvProducts[index]),
                    );
                  },
                ),
              ),

            const SizedBox(height: 10 ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Products: ${widget.products}');
                      print('Title: ${widget.title}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataCallousCatogryProduct(
                            products: widget.products,
                            title: widget.title,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: const Color(0xFF964B00),
                          size: 16,
                        ),
                        Text(
                          'مشاهدة المزيد',
                          style: TextStyle(
                            color: const Color(0xFF964B00),
                            fontFamily: 'arb',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Text(
                    'كنب',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arb',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
            if (width > 600)
              SizedBox(
                height: 370,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width < 600 ? width * 0.6 : width * 0.2,
                      child: ProductCard(product: callousProducts[index]),
                    );
                  },
                ),
              )
            else
              SizedBox(
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width < 600 ? width * 0.6 : width * 0.2,
                      child: ProductCard(product: callousProducts[index]),
                    );
                  },
                ),
              ),
            const SizedBox(height: kIsWeb ? 100 : 177),
            Container(
              color: const Color(0xFF964B00),
              width: double.infinity,
              height: width>600 ? 200 : 500,
              child: Column(
                children: [
                  Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    direction: width > 600 ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 30,
                    spacing: width > 600 ? 300 : 30,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'خصومات',
                            style: TextStyle(
                                fontFamily: 'arb',
                                color: Colors.white,
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
                              color: Colors.white,),
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
                                color: Colors.white,
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
                              color: Colors.white,),
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
                                color: Colors.white,
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
                  const SizedBox(height: 22),
                  const Center(
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
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
