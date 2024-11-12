import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rich_furniture/product/ProductData/dataDetails_model.dart';

import 'Drawer_model/furniture/callous/callous.dart';
import 'Drawer_model/furniture/telev/tabelTv.dart';
import 'Drawer_model/storage/unit.dart';
import 'home/Home.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) =>  MyApp(
      products: tableTvProducts, // Initialize the products list
      title: 'وحدات تليفزيون',  // Set the title
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<Product> products;
  final String title;

  const MyApp({super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(
            title: title,
            products: (title == 'وحدات تليفزيون') ? tableTvProducts : callousProducts,
          ),
        );
      },
    );
  }
}
