import 'package:flutter/material.dart';

import 'Bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                'للتواصل معنا، يمكنك استخدام المعلومات التالية:\n\n',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                'رقم التليفون: 01151376076\n',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                'نحن في انتظار تواصلكم ونرحب بأي استفسارات أو مقترحات. شكراً لتواصلكم معنا!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
