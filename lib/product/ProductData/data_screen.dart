import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../settings/Bar.dart';
import '../ProductDetails/details_screen.dart';
import 'dataDetails_model.dart';

class ProductGridScreen extends StatelessWidget {
  final List<Product> products;
  final String title;

  const ProductGridScreen({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    int crossAxisCount;
    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    var crossAxisSpacing = screenWidth * 0.02;
    var mainAxisSpacing = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: GridView.builder(
        padding: screenWidth < 600
            ? EdgeInsets.symmetric(horizontal: screenWidth * 0.08, )
            : EdgeInsets.all(screenWidth * 0.02),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: screenWidth < 600 ? 0.9 : 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
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
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.imageUrl != null && product.imageUrl!.isNotEmpty)
            Image.network(
              product.imageUrl!,
              height: kIsWeb ? 200 : 180,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          else if (product.imageAsset != null &&
              product.imageAsset!.isNotEmpty)
            Image.asset(
              product.imageAsset!,
              height: kIsWeb ? 200 : 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kIsWeb ? 25 : 22,
                      fontFamily: 'arb'),
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
                      style: const TextStyle(
                        color: Color(0xFF964B00),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'arb',
                        fontSize: kIsWeb ? 25 : 22,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF964B00),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: kIsWeb ? 80 : 30,
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
                        child: const Text(
                          'تفاصيل',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'arb',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
