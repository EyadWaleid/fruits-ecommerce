import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
    required this.isLoading,
    required this.child
  });
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: LoadingAnimationWidget.hexagonDots(color: Colors.white, size: 20.sp),
      inAsyncCall:isLoading ,
      child: child,
    );
  }
}
