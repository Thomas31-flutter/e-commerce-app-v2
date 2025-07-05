class ProductModel {
  final String title;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      title: jsonData["title"],
      description: jsonData["description"],
      price: jsonData["price"],
      image: jsonData["thumbnail"],
    );
  }
}
