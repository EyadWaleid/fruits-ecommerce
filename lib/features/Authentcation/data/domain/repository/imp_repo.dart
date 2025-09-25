import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled10/core/cache/shared_perferance.dart';
import 'package:untitled10/core/constants/keys.dart';
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
  await addUser(user:userEntity, uid: user.uid );
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
      var userEntity=  await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
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
        await saveUserData(user:data);
        return right(await getUserData(uid: user.uid));

      }
      else{
        await addUser(user: data, uid: user.uid);
        return right( await getUserData(uid: user.uid));
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
  Future addUser({required UserEntity user,required uid})async {
   await databaseService.addData(path: BackendEndpoints.addUserData, data:UserModel.fromEntity(user).toMap(), documentId: user.id);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
  var user=  await databaseService.getData(path: BackendEndpoints.addUserData, uid: uid);
  return UserModel.getfromFirebase(user);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var json=  JsonEncoder(UserModel.fromEntity(user).toMap());
    return await CacheHelper.saveData(key: userSaved, value: json);
  }

  @override
  Future signout() async {
    return await FirebaseAuth.instance.signOut();
  }





}