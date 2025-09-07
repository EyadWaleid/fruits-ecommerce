import 'package:dartz/dartz.dart';
import 'package:untitled10/core/error/exceptions.dart';
import 'package:untitled10/core/services/auth_services.dart';
import 'package:untitled10/features/Authentcation/data/Model/user_model.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';

import '../../../../../core/error/faliure.dart';
import '../entity/user_entity.dart';

class AuhtRepImp extends AuthRepo{
  final FirebaseAuthServices firebaseAuthServices;
  AuhtRepImp({required this.firebaseAuthServices});
  @override
  Future<Either<ServerFailure, UserEntity>> createWithEmailandPassword(String email, String password,name)async {
try {
  var user =  await firebaseAuthServices.createUserWithEmailandPassword(email, password);
  return right(UserModel.fromFirebase(user));
}on CustomExceptions catch(e) {
  return left(ServerFailure( message:e.toString()));


}

  }

  @override
  Future<Either<ServerFailure, UserEntity>> loginWithEmailandPassword(String email, String password)async {
    try{
      var user= await firebaseAuthServices.loginUserWithEmailandPassword( emailAddress: email,  password: password);
      return right( UserModel.fromFirebase(user));
    }
    on CustomExceptions catch(e){
      return left(ServerFailure(message: e.toString()));

    };

  }

  @override
  Future<Either<ServerFailure, UserEntity>> loginWithGoogle() async{
    // TODO: implement loginWithGoogle
    try{
      var user=  await firebaseAuthServices.loginWithGoogle();
      return right( UserModel.fromFirebase(user));
    }
    on CustomExceptions catch(e){
      return left(ServerFailure(message: e.toString()));
    }
  }
}