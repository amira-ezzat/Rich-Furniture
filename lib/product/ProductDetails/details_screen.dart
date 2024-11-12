import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Drawer_model/drawer.dart';
import '../../appBar/Bar.dart';
import '../../appBar/appBarr_phone.dart';
import '../ProductData/dataDetails_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final String? title;
  const ProductDetailScreen({super.key, required this.product, this.title});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openWhatsApp(String phoneNumber, String imageUrl) async {
    if (imageUrl.isNotEmpty) {
      final encodedImageUrl = Uri.encodeComponent(imageUrl);
      final whatsappUrl =
          'https://wa.me/$phoneNumber?text=أرغب%20في%20شراء%20هذا%20المنتج%20: $encodedImageUrl';
      try {
        if (await canLaunch(whatsappUrl)) {
          await launch(whatsappUrl);
        } else {
          print('Could not launch: $whatsappUrl');
        }
      } catch (e) {
        print('Error launching WhatsApp: $e');
      }
    } else {
      print('Image URL is empty, cannot open WhatsApp.');
    }
  }
  bool _isDescriptionExpanded = false;
  bool _isDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: width<600?AppBar():null,
      drawer: DrawScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  screenWidth > 600
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'arb',
                              fontSize: 30,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${widget.product.newPrice.toStringAsFixed(3)} جنيه',
                            style: const TextStyle(
                              fontFamily: 'arb',
                              color: Color(0xFF964B00),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF964B00),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                _openWhatsApp('201007356351', widget.product.imageUrl!);
                              },
                              child: const Text(
                                'اشتري الان',
                                style: TextStyle(
                                  fontFamily: 'arb',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Stack(
                        children: [
                          SizedBox(
                            height: 400,
                            width: 500,
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              children: [
                                Image.network(
                                  widget.product.imageUrl ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image1 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image2 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image3 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image4 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image5 ?? '',
                                  fit: BoxFit.contain,

                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 22,
                            top: 180,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                  ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: _previousPage,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 22,
                            top: 180,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // لون الخلفية
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: _nextPage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200, // ارتفاع الصورة ثابت
                            width: double.infinity, // عرض الصورة ثابت بحيث يمتد العرض بالكامل
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              children: [
                                Image.network(
                                  widget.product.imageUrl ?? '',
                                  fit: BoxFit.contain,
                                ),
                                Image.network(
                                  widget.product.image1 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image2 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image3 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image4 ?? '',
                                  fit: BoxFit.contain,

                                ),
                                Image.network(
                                  widget.product.image5 ?? '',
                                  fit: BoxFit.contain,

                                ),
                              ],

                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // لون الخلفية
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios, color: Colors.black), // تغيير لون الأيقونة
                                onPressed: _previousPage,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white, // لون الخلفية
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, color: Colors.black), // تغيير لون الأيقونة
                                onPressed: _nextPage,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            maxLines: 4,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'arb',
                              fontSize: 20,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: 22.h),
                          Row(
                            children: [
                              Text(
                                '${widget.product.newPrice.toStringAsFixed(3)} جنيه',
                                style: const TextStyle(
                                  fontFamily: 'arb',
                                  color: Color(0xFF964B00),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(width:11),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF964B00),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: 150,
                                child: TextButton(
                                  onPressed: () {
                                    _openWhatsApp('201007356351', widget.product.imageUrl!);
                                  },
                                  child: const Text(
                                    'اشتري الان',
                                    style: TextStyle(
                                      fontFamily: 'arb',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'الوصف: ',
                        style: TextStyle(
                          color: Color(0xFF964B00),
                          fontFamily: 'arb',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 10),
                      // الوصف
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textDirection: TextDirection.rtl,
                        maxLines: _isDescriptionExpanded ? null : 3,
                        overflow: _isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                      if (widget.product.description != null && widget.product.description!.length > 100)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDescriptionExpanded = !_isDescriptionExpanded;
                            });
                          },
                          child: Text(
                            _isDescriptionExpanded ? 'عرض أقل' : 'المزيد',
                            style: TextStyle(
                              color: Color(0xFF964B00),
                              fontFamily: 'arb',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(height: 22),
                      const Text(
                        'المواصفات: ',
                        style: TextStyle(
                          color: Color(0xFF964B00),
                          fontFamily: 'arb',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 10),
                      // المواصفات
                      Text(
                        widget.product.details ?? '',
                        style: const TextStyle(
                         fontFamily: 'cairo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textDirection: TextDirection.rtl,
                        maxLines: _isDetailsExpanded ? null : 3,
                        overflow: _isDetailsExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                      if (widget.product.details != null && widget.product.details!.length > 100)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDetailsExpanded = !_isDetailsExpanded;
                            });
                          },
                          child: Text(
                            _isDetailsExpanded ? 'عرض أقل' : 'المزيد',
                            style: TextStyle(
                              fontFamily: 'arb',
                              color: Color(0xFF964B00),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
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
