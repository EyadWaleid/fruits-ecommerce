import 'package:flutter/material.dart';

import 'notification.dart';

AppBar customeAppbar({required BuildContext context,required ,required String title}){
  return AppBar(
  leading: IconButton(onPressed: () {
Navigator.pop(context);

}, icon: Icon(Icons.arrow_back)),
title:  Text(title),
centerTitle: true,
backgroundColor: Colors.white,
elevation: 0,
actions: [
Padding(
padding: const EdgeInsets.all(8.0),
child: NotificationWidget(),
)

]
  );
}