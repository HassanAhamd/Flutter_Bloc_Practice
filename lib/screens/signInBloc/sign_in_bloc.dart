import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangeEvent>((event, emit) {
      if(EmailValidator.validate(event.email) == false){
        emit(SignInErrorState(errorMessage: "Enter Valid Email Address"));
      } else if(event.password.length < 8){
        emit(SignInErrorState(errorMessage: "Please Enter 8 digit strong password"));
      } else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
