import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../appBar/Bar.dart';
import '../../../../appBar/appBarr_phone.dart';
import '../../../../product/ProductData/dataDetails_model.dart';
import '../../../../product/ProductDetails/details_screen.dart';
import '../../../Drawer_model/drawer.dart';
import '../../../Drawer_model/storage/unit.dart';
import '../../../product/ProductDetails/details_model.dart';
import '../furnHome/furniture.dart';
class DataStorgHome extends StatefulWidget {
  final List<Product> products;
  final String title;

  const DataStorgHome({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  State<DataStorgHome> createState() => _DataStorgHomeState();
}

class _DataStorgHomeState extends State<DataStorgHome> {
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
      body:  SingleChildScrollView(
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
                    Furniture(
                      title: 'وحدة ادراج',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%A7%D8%AF%D8%B1%D8%A7%D8%AC.jpg?alt=media&token=66e4d0ba-1d7a-4be4-8124-1b877866390d',
                      products: unitDrawProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: '    بوفية',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%A8%D9%88%D9%81%D9%8A%D9%87.jpg?alt=media&token=c4ae6a97-d0af-422f-8a69-06ab2a2112c8',
                      products: boufProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'وحدة عرض',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%B9%D8%B1%D8%B6.jpg?alt=media&token=77e2c7b3-6ffe-4c9c-a645-13dc1f74280a',
                      products: showProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: '  جزامة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AC%D8%B2%D8%A7%D9%85%D8%A9.jpg?alt=media&token=25a539b2-bb3f-44f7-9fc6-4ece91611bc5',
                      products: shooseProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'تخزين حمام',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AA%D8%AE%D8%B2%D9%8A%D9%86%20%D8%AD%D9%85%D8%A7%D9%85.jpg?alt=media&token=57dac86d-4b5c-4753-a859-260ae2d18eea',
                      products: batheoomProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'تخزين مطبخ',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AA%D8%AE%D8%B2%D9%8A%D9%86%20%D9%85%D8%B7%D8%A8%D8%AE.jpg?alt=media&token=304487af-8d5a-40fc-926e-5da125da7cfe',
                      products: kitchenProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'دولاب',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AF%D9%88%D9%84%D8%A7%D8%A8.jpg?alt=media&token=5593e19f-a40b-4b6e-a861-9b4b69893fb6',
                      products: doulabProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'دريسينج',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AF%D8%B1%D9%8A%D8%B3%D9%86%D8%AC.jpg?alt=media&token=c169f0de-4f93-46e9-9ea5-333ff479b2ff',
                      products: dressingProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: '  كومود',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D9%83%D9%88%D9%85%D9%88%D8%AF.jpg?alt=media&token=54131833-e780-4ffb-b179-0fda2aa93580',
                      products: KomodProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'تسريحة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D8%AA%D8%B3%D8%B1%D9%8A%D8%AD.jpg?alt=media&token=02485f37-397a-4c66-aaed-ceb2e194ba94',
                      products: mirorProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'مكتبات',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D9%85%D9%83%D8%AA%D8%A8%D8%A7%D8%AA.jpg?alt=media&token=9d9ab129-47e4-47e2-8831-b3dc524e4f99',
                      products: libProducts,
                    ),
                    const SizedBox(width: 22),
                    Furniture(
                      title: 'ركنة قهوة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/furn%2F%D9%82%D9%87%D9%88%D8%A9.jpg?alt=media&token=ac5e1664-e268-41ca-b0ed-d40bf771ec84',
                      products: coffeProducts,
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
