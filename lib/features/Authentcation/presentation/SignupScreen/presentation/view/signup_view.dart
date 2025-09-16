import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/services/get_it.dart';
import 'package:untitled10/core/widget/TextField.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';
import 'package:untitled10/features/Authentcation/presentation/cubit/signup_cubit.dart';

import '../widget/signup_bloc_body.dart';
import '../widget/signup_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
           if(state is SignupError){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content: Text(state.errorMessage),
             ));
           }
           if(state is SignupSucess){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content: Text('تم التسجيل بنجاح '),
             ));
             Navigator.pop(context);

           }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SignupBlocBody(),
            );
          },
        ),
      ),
    );
  }
}


