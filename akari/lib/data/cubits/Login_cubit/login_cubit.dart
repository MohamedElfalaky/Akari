import 'package:akari/data/Models/log_in_model/log_in_model.dart';
import 'package:akari/data/Shared/dio_helper.dart';
import 'package:akari/data/Shared/end_points.dart';
import 'package:akari/style/Icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isHiddenPass = true;
  Widget? securityIcon = SvgPicture.asset(passOff);

  void userLogin({required email, required password}) {
    emit(LoginLoading());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      // print(value.data);
      var myLoginModel = LogInModel.fromJson(value.data);
      // print(myLoginModel.success);
      emit(LoginSuccess(myLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }

  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = SvgPicture.asset(passOff)
        : securityIcon = SvgPicture.asset(passOn);
    emit(PasswordShowen());
  }
}
