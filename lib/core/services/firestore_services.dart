import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled10/core/services/database_service.dart';
import 'package:untitled10/features/Authentcation/data/Model/user_model.dart';
import 'package:untitled10/features/Authentcation/data/domain/entity/user_entity.dart';

class FirestoreServicese implements DatabaseService{
  FirebaseFirestore firestore=  FirebaseFirestore.instance;


  @override
  Future<UserEntity> getUserData({required String path, required String uid}) async {
  var data =  await firestore.collection(path).doc(uid).get();
  return UserModel.getfromFirebase(data.data() as Map<String,dynamic>);

  }

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, required documentId}) async{
    if(documentId==null){
      await firestore.collection(path).doc(documentId).set(data,SetOptions(merge: true));
    }
    else{
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> isExist({required String path, required String uid}) {
  var user=  firestore.collection(path).doc(uid).get();
  return user.then((value) => value.exists);
  }


}

