import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/core/widget/loading_page.dart';
import 'package:untitled10/features/Authentcation/presentation/SignupScreen/presentation/widget/signup_body.dart';

import '../../../cubit/signup_cubit.dart';

class SignupBlocBody extends StatelessWidget {
  const SignupBlocBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if(state is SignupSucess){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sucessfully saved')));
          Navigator.pushReplacementNamed(context, '/login');
        }
        else if (state is SignupError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return LoadingPage(isLoading: state is SignupLoading?true:false,
        child: SignupBody());
      },
    );
  }
}
