import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled10/core/services/get_it.dart';
import 'package:untitled10/features/Authentcation/data/domain/repository/repo.dart';
import 'package:untitled10/features/Authentcation/presentation/cubit/login_cubit.dart';
import '../../../../../../core/widget/loading_page.dart';
import '../widget/login_body.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    var theme = Theme
        .of(context)
        .textTheme;

    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepo>()),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                ));
              }
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("تم التسجيل بنجاح"),
                ));}
            },
            builder: (context, state) {
              return LoadingPage(isLoading: state is LoginLoading?true:false,child: LoginBody(),);
            },
          ),
        ),
      ),
    );
  }
}


