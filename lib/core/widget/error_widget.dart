import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message
  });
  final String message ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,

      child: Center(child: Text(message)),

    );
  }
}