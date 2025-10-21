import 'package:untitled10/core/entity/product_data_entity.dart';

import '../entity/review_entity.dart';

class ReviewProductModel {
  final String name;
  final String? image;
  final String description;
  final num ratting;
  final String date;

  ReviewProductModel({
    required this.name,
    this.image,
    required this.description,
    required this.ratting,
    required this.date,
  });

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'ratting': ratting,
      'date': date,
    };
  }

  factory ReviewProductModel.fromEntity(ReviewProductEntity entity){
    return ReviewProductModel(name: entity.name,
        image: entity.image,
        description: entity.description,
        ratting: entity.raiting,
        date: entity.date);
  }
  factory ReviewProductModel.fromJson(Map<String, dynamic> json) {
    return ReviewProductModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      ratting: json['ratting'],
      date: json['date'],
    );


  }
  ReviewProductEntity toEntity() {
    return ReviewProductEntity(name: name,
        image: image,
        description: description,
        raiting: ratting,
        date: date);


  }


}