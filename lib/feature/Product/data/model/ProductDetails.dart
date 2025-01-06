class ProductDetails {
  final ProductInfo data;

  ProductDetails({required this.data});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      data: ProductInfo.fromJson(json['data']),
    );
  }
}

class ProductInfo {
  final int sold;
  final List<String> images;
  final List<Subcategory> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String imageCover;
  final Category category;
  final Brand brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final int v;
  final List<dynamic> reviews;

  ProductInfo({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.reviews,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      sold: json['sold'],
      images: List<String>.from(json['images']),
      subcategory: List<Subcategory>.from(
          json['subcategory'].map((x) => Subcategory.fromJson(x))),
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      imageCover: json['imageCover'],
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      ratingsAverage: json['ratingsAverage'].toDouble(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      reviews: List<dynamic>.from(json['reviews']),
    );
  }
}

class Subcategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class Brand {
  final String id;
  final String name;
  final String slug;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}