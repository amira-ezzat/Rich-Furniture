
class Product {
  final String name;
  final double newPrice;
  final String? imageUrl;
  final String ?image1;
  final String ?image2;
  final String ?image3;
  final String ?image4;
  final String ?image5;
  final String description;
  final String? details;


  Product({
    required this.name,
    required this.newPrice,
     this.imageUrl,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
     this.details,
    required this.description,

  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'newPrice': newPrice,
      'image1':image1,
      'image2':image2,
      'image3':image3,
      'image4':image4,
      'image5':image5,
      'imageUrl': imageUrl,
      'description': description,
      'details':details

    };
  }
}
