// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum ProductCategory {
  fruits,
  vegetables,
  oil,
  meat,
  bakery,
  snacks,
  eggs,
  baverages,
  pasta,
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double discount;
  final double rating;
  final int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    required this.rating,
    required this.quantity,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? price,
    double? discount,
    double? rating,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'discount': discount,
      'rating': rating,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      discount: map['discount'] as double,
      rating: map['rating'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, image: $image, price: $price, discount: $discount, rating: $rating, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.price == price &&
        other.discount == discount &&
        other.rating == rating &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        rating.hashCode ^
        quantity.hashCode;
  }
}
