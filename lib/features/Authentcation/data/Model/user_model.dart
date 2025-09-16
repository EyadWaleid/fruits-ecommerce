import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled10/features/Authentcation/data/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid  ??" ",
      email: user.email ?? " ",
      name: user.displayName ?? " ",
    );
  }

  factory UserModel.getfromFirebase(Map<String, dynamic> getfromFirebase) {
    return UserModel(
      id: getfromFirebase['uid'],
      email: getfromFirebase['email'],
      name: getfromFirebase['name'],
    );
  }
}
