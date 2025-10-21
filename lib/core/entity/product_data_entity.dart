import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:untitled10/core/entity/review_entity.dart';

class ProductDataEntity extends Equatable{
  String productName;
  String productCode;
  String productPrice;
  String? productImage;
  File? image;
  int numberOfCalories;
  num avgRating=0;
  num ratingCount=0;
  int uintAmount;
  int validateMounth;
  bool isFeatured;
  String desctription;
  bool isOrganic;
  List<ReviewProductEntity> review;
  ProductDataEntity({
    required this.validateMounth,
    required this.uintAmount,
    required this.numberOfCalories,
    required this.desctription,
    required this.productName,
    required this.productCode,
    required this.productPrice,
    this.productImage,
    this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.review,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [productCode];

}