// dataDetails_model.dart

class Product {
  final String name;
  final double newPrice;
  final String? imageUrl;
  final String ?imageAsset;
  final String description;


  Product({
    required this.name,
    required this.newPrice,
     this.imageUrl,
     this.imageAsset,
    required this.description,

  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'newPrice': newPrice,
      'imageUrl': imageUrl,
      'description': description,

    };
  }
}
