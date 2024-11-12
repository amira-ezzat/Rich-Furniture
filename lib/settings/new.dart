// @override
// Widget build(BuildContext context) {
//   return Drawer(
//     backgroundColor: Colors.white,
//     child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//     DrawerHeader(
//     decoration: BoxDecoration(),
//     child: Row(
//       children: [
//         CircleAvatar(
//           radius: 26.0,
//           backgroundImage: AssetImage('assets/image/logo.jpg'),
//         ),
//         SizedBox(width: 22),
//         Text(
//           'Riche Furniture',
//           style: TextStyle(
//             fontFamily: 'arb',
//             color: Color(0xFF964B00),
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     ),
//   ),
//
//   ListTile(
//   title: Text('الاثاث'),
//   trailing: Icon(
//   _isDecorExpanded
//   ? Icons.keyboard_arrow_up
//       : Icons.keyboard_arrow_down,
//   ),
//   onTap: () {
//   setState(() {
//   _isDecorExpanded = !_isDecorExpanded;
//   });
//   },
//   ),
//   if (_isDecorExpanded)
//   Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 22),
//   child: GridView.count(
//   crossAxisCount: 3,
//   shrinkWrap: true,
//   physics: NeverScrollableScrollPhysics(),
//   children: [
//   FurnitureCard(
//   title: 'سرير',
//   image:
//   'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D8%B3%D8%B1%D9%8A%D8%B1.jpg?alt=media&token=7f057182-85e8-457d-8209-6726f9504f3c',
//   products: bedProducts, // Pass dining products
//   ),
//   FurnitureCard(
//   title: 'كراسي',
//   image:
//   'https://firebasestorage.googleapis.com/v0/b/rich-furniture-43b22.appspot.com/o/images%2F%D9%83%D8%B1%D8%A7%D8%B3%D9%8A.jpg?alt=media&token=2fa10dec-8055-420b-8bc2-e8a196a16094',
//   products: diningProducts, // Pass dining products
//   ),
//   FurnitureCard(
//     title: 'كنب',
//     image:
//     'https://www.kabbanifurniture.com/cdn/shop/products/Table-With-6-Chairs_44f679fd-6965-436e-8bd7-12dfa98f3394_1800x1800.jpg?v=1655217161',
//     products: diningProducts, // Pass dining products
//   ),
//   FurnitureCard(
//     title: 'ترابيزه',
//     image:
//     'https://www.kabbanifurniture.com/cdn/shop/products/Table-With-6-Chairs_44f679fd-6965-436e-8bd7-12dfa98f3394_1800x1800.jpg?v=1655217161',
//     products: diningProducts, // Pass dining products
//   ),
//   FurnitureCard(
//     title: 'ترابيزة تليفزيون',
//     image:
//     'https://www.kabbanifurniture.com/cdn/shop/products/Table-With-6-Chairs_44f679fd-6965-436e-8bd7-12dfa98f3394_1800x1800.jpg?v=1655217161',
//     products: diningProducts, // Pass dining products
//   ),
//   FurnitureCard(
//     title: 'غرف كاملة',
//     image:
//     'https://www.kabbanifurniture.com/cdn/shop/products/Table-With-6-Chairs_44f679fd-6965-436e-8bd7-12dfa98f3394_1800x1800.jpg?v=1655217161',
//     products: diningProducts, // Pass dining products
//   ),
//   ],
//   ),
//   ),