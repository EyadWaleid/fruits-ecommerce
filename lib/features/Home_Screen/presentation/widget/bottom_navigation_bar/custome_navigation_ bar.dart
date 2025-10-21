import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

import '../../../data/domain/entites/bottom_navigator_item.dart';
import 'active_item.dart';
import 'inactive_item,.dart';

class CustomeNavigationBar extends StatefulWidget {
  CustomeNavigationBar({super.key,required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<CustomeNavigationBar> createState() => _CustomeNavigationBarState();
}

class _CustomeNavigationBarState extends State<CustomeNavigationBar> {
 int? screenIndex=0 ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -7),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigatoritem.asMap().entries.map((e) {
          var index = e.key;
          var item = e.value;
          return Expanded(
            flex: screenIndex==index?3:2,
            child: GestureDetector(
              onTap: () {
                widget.onItemTapped(index);
                print(index);

                screenIndex=index;
setState(() {

});              },
              child: NavigationBarItem(
                isSelected: screenIndex== index,
                bottomNavigatorEntity: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.bottomNavigatorEntity,
    required this.isSelected,
  });

  final BottomNavigatorEntity bottomNavigatorEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigatorEntity.activeImage,
            name: bottomNavigatorEntity.name,
          )
        : InActiveItem(image: bottomNavigatorEntity.inActiveImage);
  }
}
