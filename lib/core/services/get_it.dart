import 'package:get_it/get_it.dart';
import 'package:untitled10/core/services/auth_services.dart';
import 'package:untitled10/core/services/database_service.dart';
import 'package:untitled10/core/services/firestore_services.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/imp_repo.dart';
import 'package:untitled10/features/Home_Screen/data/domain/repo/product_imp.dart';

import '../../features/Authentcation/data/domain/repository/repo.dart';
import '../../features/Home_Screen/data/domain/repo/product_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreServicese());
  getIt.registerSingleton<AuthRepo>(AuhtRepImp(firebaseAuthServices: getIt<FirebaseAuthServices>(), databaseService: getIt<DatabaseService>()));
  getIt.registerSingleton<ProductRepo>(ProductImp(databaseService: getIt<DatabaseService>()));

}