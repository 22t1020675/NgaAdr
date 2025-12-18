class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final double rating;
  final int count;
  final double? discountPercentage;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    this.rating = 0.0,
    this.count = 0,
    this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating']?['rate'] as num?)?.toDouble() ?? 0.0,
      count: (json['rating']?['count'] as num?)?.toInt() ?? 0,
      discountPercentage: 10.0,
    );
  }
}
