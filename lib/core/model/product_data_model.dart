import 'dart:io';

import 'package:untitled10/core/model/review_product_model.dart';

import '../entity/product_data_entity.dart';
import '../entity/review_entity.dart';

class ProductDataModel {
  String productName;
  String productCode;
  String productPrice;
  String? productImage;
  File? image;
  bool isFeatured;
  bool isOrganic;
  String description;
  int numberOfCalories;
  num avgRating;

  num ratingCount;

  int uintAmount;
  int validateMounth;
  int sellingCount;

  List<ReviewProductModel> review;

  ProductDataModel({
    required this.review,
    this.sellingCount = 0,
    required this.validateMounth,
    required this.uintAmount,
    required this.numberOfCalories,
    required this.description,
    required this.productName,
    required this.productCode,
    required this.productPrice,
    this.productImage,
    this.image,
    required this.isFeatured,
    required this.isOrganic,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  ProductDataEntity toEntity() {
    return ProductDataEntity(
      productImage: productImage,
      validateMounth: validateMounth,
      uintAmount: uintAmount,
      numberOfCalories: numberOfCalories,
      desctription: description,
      productName: productName,
      productCode: productCode,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      review: review.map((e) => e.toEntity()).toList(),
      productPrice: productPrice,
    );
  }

  factory ProductDataModel.fromEntity(ProductDataEntity prodcutsDataEntity) {
    return ProductDataModel(
      numberOfCalories: prodcutsDataEntity.numberOfCalories,
      uintAmount: prodcutsDataEntity.uintAmount,
      validateMounth: prodcutsDataEntity.validateMounth,
      description: prodcutsDataEntity.desctription,
      productName: prodcutsDataEntity.productName,
      productCode: prodcutsDataEntity.productCode,
      productPrice: prodcutsDataEntity.productPrice,
      isFeatured: prodcutsDataEntity.isFeatured,
      isOrganic: prodcutsDataEntity.isOrganic,
      productImage: prodcutsDataEntity.productImage ?? "",
      image: prodcutsDataEntity.image,
      review:
          prodcutsDataEntity.review.map((e) {
            return ReviewProductModel.fromEntity(e);
          }).toList() ??
          [],
      avgRating: prodcutsDataEntity.avgRating,
      ratingCount: prodcutsDataEntity.ratingCount,
    );
  }

  toMap() {
    return {
      'product_name': productName,
      'product_code': productCode,
      'product_price': productPrice,
      'product_image': productImage,
      'is_featured': isFeatured,
      'is_organic': isOrganic,
      'description': description,
      'uint_amount': uintAmount,
      'validate_mounth': validateMounth,
      'number_of_calories': numberOfCalories,
      'avg_rating': avgRating,
      'rating_count': ratingCount,
      'review': review.map((e) => e?.toJson()).toList() ?? [],
      'selling_count': sellingCount,
    };
  }

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      productName: json['product_name'],
      productCode: json['product_code'],
      productPrice: json['product_price'],
      productImage: json['product_image'],
      isFeatured: json['is_featured'],
      isOrganic: json['is_organic'],
      description: json['description'],
      uintAmount: json['uint_amount'],
      validateMounth: json['validate_mounth'],
      numberOfCalories: json['number_of_calories'],
      avgRating: json['avg_rating'],
      ratingCount: json['rating_count'],
      review: json['review']
          .map<ReviewProductModel>((e) => ReviewProductModel.fromJson(e))
          .toList()??[],
    );
  }
}
