import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Drawer_model/drawer.dart';
import '../../appBar/Bar.dart';
import '../../appBar/appBarr_phone.dart';
import '../../product/ProductData/dataDetails_model.dart';
import '../../product/ProductDetails/details_screen.dart';

class HomeListScreen extends StatefulWidget {
  final List<Product> products;
  final String title;

  const HomeListScreen({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  _HomeListScreenState createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  late List<Product> sortedProducts;

  @override
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(0, 100, 0, 0),
                        items: [
                          PopupMenuItem(
                            value: 'LowToHigh',
                            child: Text(
                              'السعر: من الاقل للاكثر',
                              style: TextStyle(fontFamily: 'arb', fontWeight: FontWeight.bold),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'HighToLow',
                            child: Text(
                              'السعر: من الاكثر للاقل',
                              style: TextStyle(fontFamily: 'arb', fontWeight: FontWeight.bold),
                            ),
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
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xFF964B00)),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'تصفية النتائج',
                      style: TextStyle(fontFamily: 'arb', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300, // Set a fixed height for horizontal scrolling
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemCount: sortedProducts.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: screenWidth * 0.6, // Set width for each item
                    child: ProductCard(product: sortedProducts[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 77),

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
                      fontFamily: 'arb'),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF964B00),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
