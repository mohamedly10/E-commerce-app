class Products {
  final int results;
  final List<Product> data;

  Products({
    required this.results,

    required this.data,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      results: json['results'],

      data: (json['data'] as List).map((item) => Product.fromJson(item)).toList(),
    );
  }


}


class Product {
  final int sold;
  final List<String> images;
 // final List<Subcategory> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final String availableColors;
  final String imageCover;
  final Category category;
  final Brand brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.sold,
    required this.images,
    //required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.availableColors,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'],
      images: (json['images'] as List).map((item) => item as String).toList(),
    //  subcategory: (json['subcategory']??"" as List)
   //       .map((item) => Subcategory.fromJson(item))
     //     .toList(),
      ratingsQuantity: json['ratingsQuantity']??"",
      id: json['_id']??"",
      title: json['title']??"",
      slug: json['slug'],
      description: json['description']??"",
      quantity: json['quantity']??"",
      price: json['price']??"",
      priceAfterDiscount: json['priceAfterDiscount']??0,
      availableColors: json['availableColors']??"",
      imageCover: json['imageCover']??"",
      category: Category.fromJson(json['category']??""),
      brand: Brand.fromJson(json['brand']),
      ratingsAverage: json['ratingsAverage'].toDouble()??"",
      createdAt: DateTime.parse(json['createdAt']??""),
      updatedAt: DateTime.parse(json['updatedAt']??""),
    );
  }


}

// class Subcategory {
//   final String id;
//   final String name;
//   final String slug;
//   final String category;
//
//   Subcategory({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.category,
//   });
//
//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     return Subcategory(
//       id: json['_id'],
//       name: json['name'],
//       slug: json['slug'],
//       category: json['category'],
//     );
//   }
//
//
// }

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