part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginError extends LoginState {
  final String errorMessage;
  LoginError({required this.errorMessage});
}
final class LoginSuccess extends LoginState{}
final class LoginGoogleLoading extends LoginState{}
final class LoginGoogleError extends LoginState{
  final String errorMessage;
  LoginGoogleError({required this.errorMessage});

}
final class LoginGoogleSuccess extends LoginState{}
