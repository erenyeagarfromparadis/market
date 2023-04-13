import 'package:get/get.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:flutter/material.dart';

final robotoRegular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBlack = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);
final cairoRegular = TextStyle(
  fontFamily: 'Cairo',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoMedium = TextStyle(
  fontFamily: 'Cairo',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoBold = TextStyle(
  fontFamily: 'Cairo',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoBlack = TextStyle(
  fontFamily: 'Cairo',
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);


final BoxDecoration riderContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_SMALL)),
    color: Theme.of(Get.context).primaryColor.withOpacity(0.1), shape: BoxShape.rectangle,
);