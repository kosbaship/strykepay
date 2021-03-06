
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strykepay/models/user.dart';
import 'package:strykepay/network/api_provider.dart';
import 'package:strykepay/shared/constants.dart';
import 'package:strykepay/signup/cubit/signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  signUp({@required User user}) {
    //change the state
    emit(SignUpLoadingState());


    APIProvider.fetchData(
        path: kUSER_SIGN_UP_END_POINT,
        data: {
          'firstName': user.userFirstName,
          'lastName': user.userLastName,
          'password': user.userPassword,
          'email': user.userEmail,
          'dob': user.userDob,
          'phone': user.userPhone,
          'address': user.userAddress,
        }
    ).then((response) async{

      print('\n=========================================================');
      print(response.data);
      print('=========================================================\n\n');
      emit(SignUpSuccessState());
    }).catchError((e) {
      emit(SignUpErrorState(e.toString()));
    });
  }

}
