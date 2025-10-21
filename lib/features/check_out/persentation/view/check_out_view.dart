import 'package:flutter/material.dart';

import 'check_out_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CheckOutBody(),
    );
  }
}
