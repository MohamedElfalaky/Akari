import 'package:akari/data/cubits/UpdateUserPass/UpdateUserCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/AppLocalizations.dart';

class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen({super.key});

  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
  // ChangePassWordController _ChangePassWordController = ChangePassWordController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController1 = TextEditingController();
  TextEditingController newPassController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(
          height: 24,
        ),
        myTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your current password".tr(context);
            }
            return null;
          },
          prefix: lockk,
          hint: "Current Password".tr(context),
          controller: currentPassController,
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your new password".tr(context);
            } else if (value.length <= 7) {
              return "Password must be more than 7 fileds".tr(context);
            }
            return null;
          },
          hint: "New password".tr(context),
          prefix: lockk,
          controller: newPassController1,
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return "please confirm your new password".tr(context);
            } else if (value != newPassController1.text) {
              return "Passwords are not matched".tr(context);
            }
            return null;
          },
          hint: "Confirm password".tr(context),
          prefix: lockk,
          controller: newPassController2,
        ),
        const Spacer(
          flex: 3,
        ),
        BlocBuilder<UpdateUserCubit, UpdateUserState>(
          builder: (context, state) {
            return state is UpdateUserLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : myButton(() {
                    if (_formKey.currentState!.validate()) {
                      context.read<UpdateUserCubit>().userUpdateUser(
                          currentPass: currentPassController.text,
                          newPass: newPassController2.text,
                          token: CacheHelper.getFromShared("token"));
                    }
                  }, "Confirm".tr(context));
          },
        ),
        const Spacer(
          flex: 1,
        )
      ]),
    );
  }
}
