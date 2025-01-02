class SubCategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory SubCategory.fromjson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}
