import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth < 600 ? 22.sp : 11.sp;
    double bodyFontSize = screenWidth < 600 ? 15.sp : 6.sp;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Riche Furniture',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF964B00),
                  ),
                ),
              ),
              SizedBox(height: 16.h), // استخدام ScreenUtil
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  'موقع Riche Furniture هو وجهتك المثلى للحصول على أثاث عالي الجودة يتناسب مع جميع احتياجاتك. نقدم لك مجموعة واسعة من الأثاث الذي يشمل كل ما تحتاجه من غرف نوم، صالونات، ركنات، أنتريهات، غرف أطفال، سفرة، ترابيزات، بوفيهات، وأكثر. نحن هنا لنقدم لك أفضل الخيارات وفقًا لتصميمك الخاص وأذواقك الشخصية.',
                  style: TextStyle(fontSize: bodyFontSize),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  'سواء كنت تبحث عن أثاث خشبي كلاسيكي أو عصري، لدينا كل ما تحتاجه لتجعل منزلك مكانًا مريحًا وجميلاً. فريقنا المتخصص في صناعة الأثاث يضمن لك جودة عالية وتصاميم مميزة تناسب كل الأذواق.',
                  style: TextStyle(fontSize: bodyFontSize),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 6.h),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  'اتصل بنا اليوم لاستكشاف تشكيلتنا الكاملة واستشارة خبرائنا لمساعدتك في اختيار الأثاث المثالي لمنزلك.',
                  style: TextStyle(fontSize: bodyFontSize),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
