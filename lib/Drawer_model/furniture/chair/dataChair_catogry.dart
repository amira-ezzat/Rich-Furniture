import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rich_furniture/Drawer_model/furniture/bed/bed_categ.dart';
import 'package:rich_furniture/Drawer_model/furniture/chair/chair_categ.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appBar/Bar.dart';
import '../../../../appBar/appBarr_phone.dart';
import '../../../../home/catogery_home.dart';
import '../../../../product/ProductData/dataDetails_model.dart';
import '../../../../product/ProductDetails/details_screen.dart';
import '../../drawer.dart';
class DataChairCatogryProduct extends StatefulWidget {
  final List<Product> products;
  final String title;

  const DataChairCatogryProduct({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  State<DataChairCatogryProduct> createState() => _DataChairCatogryProductState();
}

class _DataChairCatogryProductState extends State<DataChairCatogryProduct> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FurnitureCard(
                      title: 'كرسي الطعام',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fdinning_chair-removebg-preview.png?alt=media&token=43f30b90-dd6d-4b95-8be2-e94d89b48732',
                      products: foodchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كرسي بار',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fbar_chair-removebg-preview.png?alt=media&token=aa2a093c-63e3-4825-9f40-5c610dda6b93',
                      products: barchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كرسي جانبي',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fside_chair-removebg-preview.png?alt=media&token=e81dbab8-372f-4c81-9614-4070aa4cb817',
                      products: sidchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كرسي هزاز',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Frockie-chair-removebg-preview.png?alt=media&token=b69785a1-d4c2-4082-b80b-56eb0c7ebe75',
                      products: hamkchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كرسي استرخاء',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Frecliner-removebg-preview.png?alt=media&token=1e5eec5c-a726-49d7-b17f-9fde080745f4',
                      products: restchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'كرسي بذراعين',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Farm_chair-removebg-preview.png?alt=media&token=762f1a8d-8889-4e52-bb66-8decdbe53dee',
                      products: armchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: '    بوف',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fpouf_2-removebg-preview.png?alt=media&token=f912d652-9029-426d-86d8-af0452922517',
                      products: bofchairProducts,
                    ),
                    const SizedBox(width: 22),
                    FurnitureCard(
                      title: 'شزلونج',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fchaise-lounge-removebg-preview.png?alt=media&token=97249124-e0dd-4c8a-91d8-39e75a487611',
                      products: longchairProducts,
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
