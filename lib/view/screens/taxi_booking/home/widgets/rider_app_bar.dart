import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/notification_controller.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/web_menu_bar.dart';
class RiderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RiderAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context) ? WebMenuBar() : Container(
      width: Dimensions.WEB_MAX_WIDTH, height: 70, color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
      child: GetBuilder<SplashController>(
        builder: (splashController) {
          return Padding(
            padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              (splashController.module != null && splashController.configModel.module == null) ? InkWell(
                onTap: () => splashController.removeModule(),
                child: Image.asset(Images.module_icon, height: 22, width: 22, color: Theme.of(context).textTheme.bodyLarge.color),
              ) : SizedBox(),
              SizedBox(width: (splashController.module != null && splashController.configModel.module
                  == null) ? Dimensions.PADDING_SIZE_EXTRA_SMALL : 0),
              Expanded(child: InkWell(
                onTap: () => Get.toNamed(RouteHelper.getAccessLocationRoute('home')),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_SMALL,
                    horizontal: ResponsiveHelper.isDesktop(context) ? Dimensions.PADDING_SIZE_SMALL : 0,
                  ),
                  child: GetBuilder<LocationController>(builder: (locationController) {
                    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          locationController.getUserAddress().addressType == 'home' ? Icons.home_filled
                              : locationController.getUserAddress().addressType == 'office' ? Icons.work : Icons.location_on,
                          size: 20, color: Theme.of(context).textTheme.bodyLarge.color,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            locationController.getUserAddress().address,
                            style: cairoRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge.color, fontSize: Dimensions.fontSizeSmall,
                            ),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Theme.of(context).textTheme.bodyLarge.color),
                      ],
                    );
                  }),
                ),
              )),
              InkWell(
                child: GetBuilder<NotificationController>(builder: (notificationController) {
                  return Stack(children: [
                    Icon(Icons.notifications, size: 25, color: Theme.of(context).textTheme.bodyLarge.color),
                    notificationController.hasNotification ? Positioned(top: 0, right: 0, child: Container(
                      height: 10, width: 10, decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor, shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Theme.of(context).cardColor),
                    ),
                    )) : SizedBox(),
                  ]);
                }),
                onTap: () => Get.toNamed(RouteHelper.getNotificationRoute()),
              ),
            ]),
          );
        }
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 70 : 70);
}
