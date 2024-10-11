import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../settings/Bar.dart';
import '../ProductData/dataDetails_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  void _openWhatsApp(String phoneNumber) async {
    final whatsappUrl = 'https://wa.me/$phoneNumber';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              screenWidth > 600
                  ? Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          // width: screenWidth.h * 0.50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'arb',
                                  fontSize: 30,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${product.newPrice.toStringAsFixed(2)} جنيه',
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
                                    _openWhatsApp('201007356351');
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
                        ),
                        SizedBox(width: 33.h),
                        if (product.imageUrl != null &&
                            product.imageUrl!.isNotEmpty)
                          Image.network(
                            height: 400,
                            width: 700,
                            product.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        else if (product.imageAsset != null &&
                            product.imageAsset!.isNotEmpty)
                          Image.asset(
                            product.imageAsset!,
                            fit: BoxFit.cover,
                          )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (product.imageUrl != null &&
                            product.imageUrl!.isNotEmpty)
                          Image.network(
                            product.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        else if (product.imageAsset != null &&
                            product.imageAsset!.isNotEmpty)
                          Image.asset(
                            product.imageAsset!,
                            fit: BoxFit.cover,
                          ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'arb',
                                    fontSize: 30,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF964B00),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  width: 150,
                                  child: TextButton(
                                    onPressed: () {
                                      _openWhatsApp('201007356351');
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
                            SizedBox(height: 10.h),
                            Text(
                              '${product.newPrice.toStringAsFixed(2)} جنيه',
                              style: const TextStyle(
                                fontFamily: 'arb',
                                color: Color(0xFF964B00),
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 10.h),
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
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontFamily: 'arb',
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
