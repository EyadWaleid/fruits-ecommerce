import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/services/get_it.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';
import 'package:untitled10/features/Authentcation/presentation/cubit/signup_cubit.dart';

import '../widget/signup_bloc_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: Scaffold(
          backgroundColor: Colors.white,
            body: SignupBlocBody()),
      ),
    );
  }
}


