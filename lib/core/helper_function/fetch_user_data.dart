import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled10/core/cache/shared_perferance.dart';
import 'package:untitled10/core/constants/keys.dart';
import 'package:untitled10/features/Authentcation/data/Model/user_model.dart';
import 'package:untitled10/features/Authentcation/data/domain/entity/user_entity.dart';

UserEntity getUserData(){
  var json=CacheHelper.getString(key: userSaved);
  var userEntity=UserModel.getfromFirebase(jsonDecode(json!) );
  return userEntity;
}