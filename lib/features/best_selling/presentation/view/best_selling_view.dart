import 'package:flutter/material.dart';
import 'package:untitled10/core/widget/custome_appbar.dart';

import '../../../../core/widget/notification.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbar(context: context, title: 'الأكثر مبيعًا')
    );
  }
}
