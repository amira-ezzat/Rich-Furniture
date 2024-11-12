import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rich_furniture/Drawer_model/furniture/bed/bed_categ.dart';
import 'package:rich_furniture/Drawer_model/furniture/chair/chair_categ.dart';
import 'package:rich_furniture/Drawer_model/furniture/table/table_category.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appBar/Bar.dart';
import '../../../../appBar/appBarr_phone.dart';
import '../../../../home/catogery_home.dart';
import '../../../../product/ProductData/dataDetails_model.dart';
import '../../../../product/ProductDetails/details_screen.dart';
import '../../drawer.dart';
class DataTableCatogryProduct extends StatefulWidget {
  final List<Product> products;
  final String title;

  const DataTableCatogryProduct({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  State<DataTableCatogryProduct> createState() => _DataTableCatogryProductState();
}

class _DataTableCatogryProductState extends State<DataTableCatogryProduct> {
  late List<Product> sortedProducts;
  void initState() {
    super.initState();
    sortedProducts = List.from(widget.products);
  }

  void _sortProducts(bool ascending) {
    setState(() {
      sortedProducts.sort((a, b) =>
      ascending ? a.newPrice.compareTo(b.newPrice) : b.newPrice.compareTo(a.newPrice));
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    var crossAxisCount = screenWidth > 1200 ? 4 : screenWidth > 800 ? 3 : 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: screenWidth < 600 ?
      CustomAppBarPhone(products:widget.products,title: widget.title,) :
      CustomAppBar(products:widget.products,title: widget.title,),
      drawer: DrawScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 8,),
                  OutlinedButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(0, 100, 0, 0),
                        items: [
                          PopupMenuItem(
                            value: 'LowToHigh',
                            child: Text('السعر: من الاقل للاكثر',
                              style: TextStyle(
                                  fontFamily: 'arb',
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          PopupMenuItem(
                            value: 'HighToLow',
                            child: Text('السعر: من الاكثر للاقل',
                              style: TextStyle(
                                  fontFamily: 'arb',
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ],
                      ).then((value) {
                        if (value == 'LowToHigh') {
                          _sortProducts(true);
                        } else if (value == 'HighToLow') {
                          _sortProducts(false);
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF964B00),
                      backgroundColor: Colors.white,               // Text color
                      side: BorderSide(color: Color(0xFF964B00)), // Border color
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text('تصفية النتائج',
                      style: TextStyle(
                          fontFamily: 'arb',
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Builder(
                    builder: (context) {
                      return PopupMenuTheme(
                        data: PopupMenuThemeData(
                          color: Colors.white,
                        ),
                        child: Container(),
                      );
                    },
                  ),
                ],
              ),

            ),
            // Horizontal scrollable FurnitureCards
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FurnitureCard(
                      title: 'ترابيزة سفرة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/img%2F%D8%B3%D9%81%D8%B1%D9%87.jpg?alt=media&token=bdb7bd8d-272d-48d9-9b98-7c2c9e934848',
                      products: didingTableProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'جانبية خشبية',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/img%2F%D8%AC%D9%86%D8%A8%D8%AE%D8%B4.jpg?alt=media&token=13d4fa1b-d143-4f83-aec1-4fd0d7e73cdb',
                      products: sidwoodTableProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'وسط خشبي',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/img%2F%D9%88%D8%B3%D8%AE%D8%B4.jpg?alt=media&token=d9597bcc-cda6-42e4-b281-fb424b9bd3c2',
                      products: midwoodTableProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كونسول خشبي',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/img%2F%D9%83%D9%88%D9%86%D8%AE%D8%B4.jpg?alt=media&token=060b136b-a1ce-402d-a2e4-acdc92409268',
                      products: conwoodTableProducts,
                    ),


                  ],
                ),
              ),
            ),
            const SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: sortedProducts
                    .map((product) => SizedBox(
                  width: (screenWidth / crossAxisCount) - 16,
                  child: ProductCard(product: product),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height:  77 ),
            SingleChildScrollView(
              child: Container(
                color: const Color(0xFF964B00),
                width: double.infinity,
                height: screenWidth > 600 ? 200 : 500,
                child: Column(
                  children: [
                    Wrap(
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
                                color: Colors.white,
                              ),
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
                                color: Colors.white,
                              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl!,
            height: screenWidth < 600 ? 140 : 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth > 600 ? 25 : 16,
                    fontFamily: 'arb',
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: screenWidth < 600
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      '${product.newPrice.toStringAsFixed(3)} جنية',
                      style: TextStyle(
                        color: Color(0xFF964B00),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'arb',
                        fontSize: screenWidth > 600 ? 25 : 16,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(width: screenWidth > 600 ? 44 : 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF964B00),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: screenWidth > 600 ? 40 : 25,
                      width: screenWidth > 600 ? 80 : 44,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: Text(
                          'تفاصيل',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'arb',
                            fontSize: screenWidth > 600 ? 18 : 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Spacer(),
                    Text('ينتج عند الطلب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        fontSize: screenWidth > 600 ? 25 : 16,
                        fontFamily: 'arb',
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
