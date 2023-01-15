import 'dart:math';

import 'package:akari/data/Models/get_user_data_model/get_user_data_model.dart';
import 'package:akari/data/Repositries/ContactUsRepo.dart';
import 'package:akari/helpers/CacheHelper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ContactUsState.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  static ContactUsCubit get(context) => BlocProvider.of(context);
  ContactUsRepo contactUsRepo = ContactUsRepo();

  void userContactUs({
    required String receiverEmail,
    required String subject,
    required String message,
    required String name,
  }) {
    try {
      emit(ContactUsLoading());
      contactUsRepo
          .contactUs(
              token: CacheHelper.getFromShared("token"),
              receiverEmail: receiverEmail,
              subject: subject,
              message: message,
              name: name)
          .then((value) {
        if (value != null) {
          emit(ContactUsSuccess(value));
        } else {
          print(value);
          emit(ContactUsError(value.toString()));
        }
      });
    } catch (e) {
      emit(ContactUsError(e.toString()));
    }
  }
}
