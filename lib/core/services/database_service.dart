import 'package:untitled10/features/Authentcation/data/domain/entity/user_entity.dart';

abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,required documentId});
  Future<Map<String,dynamic>> getData({required String path, required String uid});
  Future<bool>isExist({required String path,required String uid});

}