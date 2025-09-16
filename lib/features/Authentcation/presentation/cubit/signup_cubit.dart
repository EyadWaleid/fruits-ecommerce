import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> signup(String email,String password,String name)async{
    emit(SignupLoading());
    final result=await authRepo.createWithEmailandPassword( email: email, password: password, name:name);
    result.fold((l) => emit(SignupError(errorMessage: l.message)), (r) => emit(SignupSucess()));


  }
}
