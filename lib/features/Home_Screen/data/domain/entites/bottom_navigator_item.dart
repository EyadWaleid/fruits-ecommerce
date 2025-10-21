import '../../../../../core/utlis/generated/assets.dart';

class BottomNavigatorEntity {
  BottomNavigatorEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });

  final String activeImage, inActiveImage;
  final String name;


}

List<BottomNavigatorEntity> get bottomNavigatoritem => [
  BottomNavigatorEntity(
    activeImage: Assets.boldHome,
    inActiveImage: Assets.outlineHome,
    name: "الرئيسية",
  ),
  BottomNavigatorEntity(
    activeImage: Assets.boldProducts,
    inActiveImage: Assets.outlineProducts,
    name: "المنتجات",
  ),
  BottomNavigatorEntity(
    activeImage: Assets.boldShoppingCart,
    inActiveImage: Assets.outlineShoppingCart,
    name: "سلة التسوق",
  ),
  BottomNavigatorEntity(
    activeImage: Assets.boldUser,
    inActiveImage: Assets.outlineUser,
    name: "حسابي",
  ),
];