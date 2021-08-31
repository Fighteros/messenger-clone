import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_mini_clone/shared/cubit/cubit.dart';
import 'package:messenger_mini_clone/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, states) {
          AppCubit cubit = AppCubit.get(context);
          return cubit.screens[cubit.currentIndex];
        },
        listener: (context, states) {},
      ),
    );
  }
}
