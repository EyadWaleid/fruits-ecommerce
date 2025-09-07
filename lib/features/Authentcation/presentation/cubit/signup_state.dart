part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupSucess extends SignupState {}
final class SignupError extends SignupState {
 final  String errorMessage;
  SignupError({required this.errorMessage});
}
