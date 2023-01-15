import 'package:akari/data/cubits/ContactUs/ContactUsCubit.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/AppLocalizations.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _msgController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: [
        const SizedBox(
          height: 24,
        ),
        myTextField(
          hint: "Email".tr(context),
          controller: _mailController,
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your mail".tr(context);
            }
            return null;
          },
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          hint: "Subject".tr(context),
          controller: _subjectController,
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter massage subject".tr(context);
            }
            return null;
          },
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          hint: "Name".tr(context),
          controller: _nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your name".tr(context);
            }
            return null;
          },
        ),
        const SizedBox(
          height: 24,
        ),
        myTextField(
          hint: "Message".tr(context),
          maxLines: 8,
          controller: _msgController,
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter massage".tr(context);
            }
            return null;
          },
        ),
        const SizedBox(
          height: 32,
        ),
        BlocBuilder<ContactUsCubit, ContactUsState>(
          builder: (context, state) {
            return state is ContactUsLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : myButton(() {
                    if (_formKey.currentState!.validate()) {
                      context.read<ContactUsCubit>().userContactUs(
                          name: _nameController.text,
                          receiverEmail: _mailController.text,
                          subject: _subjectController.text,
                          message: _msgController.text);
                    }
                  }, "Submit".tr(context));
          },
        ),
      ]),
    );
  }
}
