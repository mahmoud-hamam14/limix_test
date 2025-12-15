
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {}
class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
