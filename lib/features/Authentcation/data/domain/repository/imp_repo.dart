import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled10/core/error/exceptions.dart';
import 'package:untitled10/core/services/auth_services.dart';
import 'package:untitled10/core/services/database_service.dart';
import 'package:untitled10/core/utlis/endpoints.dart';
import 'package:untitled10/features/Authentcation/data/Model/user_model.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';

import '../../../../../core/error/faliure.dart';
import '../entity/user_entity.dart';

class AuhtRepImp extends AuthRepo{
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService ;
  AuhtRepImp({required this.databaseService,required this.firebaseAuthServices});

  @override
  Future<Either<ServerFailure, UserEntity>> createWithEmailandPassword({required String email, required String password,required String name})async {
    User? user;
    try {

   user =  await firebaseAuthServices.createUserWithEmailandPassword(email, password);
  var userEntity= UserModel(id: user.uid, email: email, name: name);
  await addUser(user:userEntity );
  return right(UserModel.fromFirebase(user));
}on CustomExceptions catch(e) {
      if(user !=null){
        firebaseAuthServices.delete();
      }
  return left(ServerFailure( message:e.toString()));


}catch(e){
      if(user !=null){
        firebaseAuthServices.delete();
      }
      return left(ServerFailure(message: 'حدث خطأ ما '));
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
    User? user;
    try{
       user=  await firebaseAuthServices.loginWithGoogle();
       var data=UserModel.fromFirebase(user);
       var isExist= await databaseService.isExist(path: BackendEndpoints.addUserData, uid: user.uid);
      if(isExist){
        return right(UserModel.fromFirebase(user));
      }
      else{
        await addUser(user: data);
        return right( UserModel.fromFirebase(user));
      }

    }
    on CustomExceptions catch(e){
      if(user ==null)
      {
        return left(ServerFailure(message: e.toString()));
      }
      else{
        firebaseAuthServices.delete();
        return left(ServerFailure(message: e.toString()));
      }

    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> loginWithFacebook() async{
    try{
      var user=  await firebaseAuthServices.loginWithFacebook();
      return right( UserModel.fromFirebase(user));
    }
    on CustomExceptions catch(e){
      return left(ServerFailure(message: e.toString()));


    }

  }

  @override
  Future addUser({required UserEntity user})async {
    databaseService.addData(path: BackendEndpoints.addUserData, data: user.tomap(), documentId: user.id);
  }

}