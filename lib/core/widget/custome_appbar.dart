import 'package:flutter/material.dart';

import 'notification.dart';

AppBar CustomeAppbar({required BuildContext context,required ,required String title,bool notification=true}){
  return AppBar(
  leading: IconButton(onPressed: () {
Navigator.pop(context);

}, icon: Icon(Icons.arrow_back)),
title:  Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
centerTitle: true,
backgroundColor: Colors.white,
elevation: 0,
actions: [
Padding(
padding: const EdgeInsets.all(8.0),
child: Visibility(
visible:notification ,
child: NotificationWidget()),
)

]
  );
}