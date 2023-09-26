class CategoryModel {
  String? name, image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
