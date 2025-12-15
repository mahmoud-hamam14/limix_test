import 'package:bloc/bloc.dart';
import 'package:limix_test/features/auth/cubit/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

 void userLogin({
    required String email,
    required String password,
  }) 
  {
    emit(LoginLoadingState()); 

   
    Future.delayed(const Duration(seconds: 2), () {
      if (email == "farmer@limix.eg" && password == "12345678") {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState("Invalid email or password"));
      }
    });
  }
  }