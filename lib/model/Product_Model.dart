import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductModel {
  String? name, image, description, size, price;
  Color? color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor(map['color']);
    size = map['size'];
    price = map['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price
    };
  }
}
