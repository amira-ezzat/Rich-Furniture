
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich_furniture/Drawer_model/offices/office.dart';
import 'package:rich_furniture/Drawer_model/outf/out.dart';
import 'package:rich_furniture/Drawer_model/storage/unit.dart';

import '../product/ProductDetails/details_model.dart';
import 'categories_drawer.dart';
import 'furniture/bed/bed.dart';
import 'furniture/callous/callous.dart';
import 'furniture/chair/chair.dart';
import 'furniture/kids/kids.dart';
import 'furniture/room/rom.dart';
import 'furniture/table/table.dart';
import 'furniture/telev/tabelTv.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  bool _isDecorExpanded = false;
  bool _isStorageExpanded = false;
  bool _isOfficeFurnitureExpanded = false;
  bool _isKitchenExpanded = false;
  bool _isOutExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26.0,
                  backgroundImage: AssetImage('assets/image/logo.jpg'),
                ),
                SizedBox(width: 22),
                Text(
                  'Riche Furniture',
                  style: TextStyle(
                    fontFamily: 'arb',
                    color: Color(0xFF964B00),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('الاثاث',
              style: TextStyle(
                fontFamily: 'arb',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),

            ),
            trailing: Icon(
              _isDecorExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                _isDecorExpanded = !_isDecorExpanded;
              });
            },
          ),
          const SizedBox(height: 11,),
          if (_isDecorExpanded)
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    FurnitureDrawer(
                      title: '     سرير',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%B3.png?alt=media&token=e6ac127e-1f3e-422e-b378-0bab80fdf7d9',
                      products: bedProducts,
                    ),
                    FurnitureDrawer(
                      title: '  كراسي',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D9%83%D8%B1%D8%A7%D8%B3%D9%8A-removebg-preview.png?alt=media&token=3058fa2b-4ea6-4410-b0fa-8624f9497e6e',
                      products: chairProducts,
                    ),
                    FurnitureDrawer(
                      title: '   كنب',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D9%83%D9%86%D8%A8-removebg-preview.png?alt=media&token=cae1a2bf-409d-4323-9fa4-d38977f95b33',
                      products: callousProducts,
                    ),
                    FurnitureDrawer(
                      title: '  ترابيزة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%AA%D8%B1%D8%A7%D8%A8%D9%8A%D8%B2%D8%A7%D8%AA-removebg-preview.png?alt=media&token=4f9be2f7-cd85-4e7f-a16a-fac994f30af3',
                      products: tableProducts,
                    ),
                    FurnitureDrawer(
                      title: 'ترابيزة تليفزيون',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%AA%D9%84%D9%8A%D9%81%D8%B2%D9%8A%D9%88%D9%86-removebg-preview.png?alt=media&token=048a3b63-b8a4-4e99-8125-e4be1fd9237c',
                      products: tableTvProducts,
                    ),
                    FurnitureDrawer(
                      title: 'غرف كاملة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%BA%D8%B1%D9%81_%D9%83%D8%A7%D9%85%D9%84%D9%87-removebg-preview.png?alt=media&token=22586a34-d353-41aa-a980-0391d5701c20',
                      products: roomProducts,
                    ),
                    FurnitureDrawer(
                      title: 'حديثي الولادة',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%AD%D8%AF%D9%8A%D8%AB-removebg-preview.png?alt=media&token=02ea6191-e0d9-4395-a45d-00800d9af67b',
                      products: kidProducts,
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0,),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('وحدات تخزين',
              style: TextStyle(
                fontFamily: 'arb',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              _isStorageExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                _isStorageExpanded = !_isStorageExpanded;
              });
            },
          ),
          const SizedBox(height: 11,),
          if (_isStorageExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FurnitureDrawer(
                    title: 'وحدة ادراج',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Funit_drawer-removebg-preview.png?alt=media&token=117cfe63-0c6a-4f43-9330-7b4499144a9e',
                    products: unitDrawProducts,
                  ),
                  FurnitureDrawer(
                    title: '    بوفية',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fbuffet-removebg-preview.png?alt=media&token=04491dd5-c11e-4dc1-8608-792a6eb2f91a',
                    products: boufProducts,
                  ),
                  FurnitureDrawer(
                    title: 'وحدة عرض',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fdisplay-removebg-preview.png?alt=media&token=ebb66b8b-76df-4e64-941d-cd76af457779',
                    products: showProducts,
                  ),
                  FurnitureDrawer(
                    title: '  جزامة',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fshoe_rack-removebg-preview.png?alt=media&token=3c34fd1f-d716-4fec-975e-3a816af219e6',
                    products: shooseProducts,
                  ),
                  FurnitureDrawer(
                    title: 'تخزين حمام',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fbathroom_storage-removebg-preview.png?alt=media&token=e5bd2198-c26e-4ac3-b285-726c5bbe9428',
                    products: batheoomProducts,
                  ),
                  FurnitureDrawer(
                    title: 'تخزين مطبخ',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fkitchen_storage-removebg-preview.png?alt=media&token=76c1e84a-282b-45f8-9ff5-abe33acbf3af',
                    products: kitchenProducts,
                  ),
                  FurnitureDrawer(
                    title: 'دولاب',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fwardrobe-removebg-preview.png?alt=media&token=9d45a523-f4b7-4ca8-afdc-c33a41b50971',
                    products: doulabProducts,
                  ),
                  FurnitureDrawer(
                    title: 'دريسينج',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2FWARDROBE_4-removebg-preview.png?alt=media&token=13c26c14-214c-47d9-809a-d3327b7ba73d',
                    products: dressingProducts,
                  ),
                  FurnitureDrawer(
                    title: '  كومود',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fcommode-removebg-preview.png?alt=media&token=64b8e2a3-dd34-4171-b1d8-9eaa430913b2',
                    products: KomodProducts,
                  ),
                  FurnitureDrawer(
                    title: 'تسريحة',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fmakeup-removebg-preview.png?alt=media&token=0223e880-3bb3-46a4-9642-adda1259dd69',
                    products: mirorProducts,
                  ),
                  FurnitureDrawer(
                    title: 'مكتبات',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fbookcase_1-removebg-preview.png?alt=media&token=8a67d9ef-7ba7-4ffb-8000-eeccdfd603df',
                    products: libProducts,
                  ),
                  FurnitureDrawer(
                    title: 'ركنة قهوة',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fcoffee_corner-removebg-preview.png?alt=media&token=e164b574-8f96-4f87-92a2-26bb0f26628e',
                    products: coffeProducts,
                  ),
                ],
              ),
            ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 11.0,),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('أثاث مكتبي',
              style: TextStyle(
                fontFamily: 'arb',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            trailing: Icon(
              _isOfficeFurnitureExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                _isOfficeFurnitureExpanded = !_isOfficeFurnitureExpanded;
              });
            },
          ),
          const SizedBox(height: 11,),
          if (_isOfficeFurnitureExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FurnitureDrawer(
                    title: 'مكاتب خشب',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fdesk_1-removebg-preview.png?alt=media&token=8119e47e-3434-49a6-8fb9-5592a4a289ad',
                    products: offwodProducts,
                  ),


                  FurnitureDrawer(
                    title: 'وحدة تخزين',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fsorage--removebg-preview.png?alt=media&token=5ed5eede-023d-41a3-86d8-9ceb5e757da7',
                    products:offunitProducts ,
                  ),

                  FurnitureDrawer(
                    title: 'مكاتب مديرين',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fmang-removebg-preview.png?alt=media&token=03a65dd5-4cc1-4eb5-b483-53fe25369fbd',
                    products: mangoffProducts,
                  ),
                  FurnitureDrawer(
                    title: 'ترابيزة اجتماعات',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fdesk_2-removebg-preview.png?alt=media&token=2035d0bd-db68-4d01-a6ff-1a75efb5491e',
                    products: tabmeetProducts,
                  ),
                  FurnitureDrawer(
                    title: 'مكاتب مقسم',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fwork_station-removebg-preview.png?alt=media&token=f80f1b53-749d-4c00-b082-2bc1f3ee0986',
                    products: dividofftProducts,
                  ),

                  FurnitureDrawer(
                    title: 'مكتب استقبال',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Freception-removebg-preview.png?alt=media&token=9773f3a2-4873-48f5-9058-9ece8fc2f8cc',
                    products: respProducts,
                  ),
                  FurnitureDrawer(
                    title: 'مكاتب اطفال',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fd_2-removebg-preview.png?alt=media&token=b0ebf33a-f175-4377-9d92-68bc4d1f2903',
                    products: chioffProducts,
                  ),
                  // FurnitureDrawer(
                  //   title: 'ترابيزة',
                  //   image:
                  //   '',
                  //   products: diningProducts,
                  // ),
                  // // Add more office items here
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0,),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 11,),
          ListTile(
            title: Text('أثاث خارجي',
              style: TextStyle(
                fontFamily: 'arb',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            trailing: Icon(
              _isOutExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                _isOutExpanded = !_isOutExpanded;
              });
            },
          ),
          const SizedBox(height: 11,),
          if (_isOutExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FurnitureDrawer(
                    title: 'اراجيح',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fhangning-chair_1-removebg-preview.png?alt=media&token=8103c560-51f3-4a23-8700-a9b45cafd6d6',
                    products: swingProducts,
                  ),


                  FurnitureDrawer(
                    title: 'كرسي خارجي',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Foutdoor_chair-removebg-preview.png?alt=media&token=2ccba104-1f29-4a4f-a44f-db31a2a4c65b',
                    products: outchairProducts,
                  ),
                  FurnitureDrawer(
                    title: 'اساسيات الشاطئ',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Fsunbeds-removebg-preview.png?alt=media&token=62c25ea0-21d9-4490-9c28-442ea3018a87',
                    products: outbeachProducts,
                  ),

                  FurnitureDrawer(
                    title: 'كنبة خارجية',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Foutdoor_1-removebg-preview.png?alt=media&token=4cba1271-47d5-4e29-831a-053078faf4b7',
                    products: outcallProducts,
                  ),
                  FurnitureDrawer(
                    title: 'طاولة خارجية',
                    image:
                    'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2Foutdoor_table-removebg-preview.png?alt=media&token=f1dd16b8-5d58-4b4b-8ccb-24664ff16d03',
                    products: outtableProducts,
                  ),


                ],
              ),
            ),
        ],
      ),
    );

  }



}