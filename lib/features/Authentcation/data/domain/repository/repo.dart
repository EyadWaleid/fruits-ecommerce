import 'package:dartz/dartz.dart';
import 'package:untitled10/core/error/faliure.dart';

import '../entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, UserEntity>> createWithEmailandPassword(
  { required String email,
   required String password,
      required String name}
  );
  Future<Either<ServerFailure,UserEntity>>loginWithEmailandPassword(String email, String password);
  Future <Either<ServerFailure,UserEntity>>loginWithGoogle();
  Future<Either<ServerFailure,UserEntity>>loginWithFacebook();
  Future addUser({required UserEntity user});

}
