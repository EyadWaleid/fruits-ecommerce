import 'package:dartz/dartz.dart';
import 'package:untitled10/core/error/faliure.dart';

import '../entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, UserEntity>> createWithEmailandPassword(
    String email,
    String password,
      String name
  );
  Future<Either<ServerFailure,UserEntity>>loginWithEmailandPassword(String email, String password);
  Future <Either<ServerFailure,UserEntity>>loginWithGoogle();

}
