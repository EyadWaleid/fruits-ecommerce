import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailandPassword(email, password);
    result.fold(
      (l) => emit(LoginError(errorMessage: l.message)),
      (r) => emit(LoginSuccess()),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (l) => emit(LoginError(errorMessage: l.message)),
      (r) => emit(LoginSuccess()),
    );
  }
  Future<void>loginWithFacebook()async{
    emit(LoginLoading());
     final result= await authRepo.loginWithFacebook();
    result.fold(
        (l)=>emit(LoginError(errorMessage: l.message)),
    (r)=>emit(LoginSuccess())
    );
  }
}
