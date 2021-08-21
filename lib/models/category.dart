import 'package:reserly_manager/types/json_type.dart';

class Category {
  int id;
  String name;

  Category({ required this.id, required this.name });

  factory Category.fromJson(Json json) => Category(
    id: json["id"],
    name: json["name"],
  );
}

class CategoryResponse {
  List<Category> categories;

  CategoryResponse({ required this.categories });

  factory CategoryResponse.fromJson(Json json) => CategoryResponse(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );
}