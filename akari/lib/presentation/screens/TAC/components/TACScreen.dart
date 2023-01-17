import 'package:akari/data/cubits/TAC/TACCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/TAC/components/OneTAC.dart';
import 'package:akari/presentation/screens/TAC/controller/TACController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TACScreen extends StatefulWidget {
  const TACScreen();

  @override
  State<TACScreen> createState() => _TACScreenState();
}

class _TACScreenState extends State<TACScreen> {
  TACController _TACController = TACController();

  @override
  void initState() {
    super.initState();
    _TACController.TACAPIs(context, CacheHelper.getFromShared("token"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TACCubit, TACState>(
      builder: (context, state) {
        return state is TACSuccess
            ? ListView.builder(
                itemCount: state.myTACModel.data!.length,
                itemBuilder: (context, index) => OneTAC(
                  datee: state.myTACModel.data![index].updatedAt,
                  titlee: state.myTACModel.data![index].title,
                  bodyy: state.myTACModel.data![index].description,
                ),
              )
            : Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
