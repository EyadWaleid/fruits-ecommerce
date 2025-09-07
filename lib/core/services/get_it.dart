import 'package:get_it/get_it.dart';
import 'package:untitled10/core/services/auth_services.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/imp_repo.dart';
import 'package:untitled10/features/Authentcation/presentation/cubit/signup_cubit.dart';

import '../../features/Authentcation/data/domain/repository/repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(AuhtRepImp(firebaseAuthServices: getIt<FirebaseAuthServices>()));

}