import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/data/model/body/user_information_body.dart';
import 'package:sixam_mart/data/model/response/vehicle_model.dart';
import 'package:sixam_mart/helper/price_converter.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/custom_app_bar.dart';
import 'package:sixam_mart/view/base/custom_button.dart';
import 'package:sixam_mart/view/base/custom_image.dart';
import 'widgets/car_cost.dart';
import 'widgets/car_info.dart';
import 'widgets/provider_details.dart';

class CarDetailsScreen extends StatelessWidget {
  final Vehicles vehicle;
  final UserInformationBody filterBody;
  const CarDetailsScreen({Key key, @required this.vehicle, @required this.filterBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'car_details'.tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_SMALL)),
                        child: CustomImage(
                            height: 200,
                            width: double.infinity,
                            image: '${Get.find<SplashController>().configModel.baseUrls.vehicleImageUrl}/${vehicle.carImages.isNotEmpty ? vehicle.carImages[0] : ''}')),
                    SizedBox(height: 170)
                  ],
                ),
                CarInfo(vehicle: vehicle),
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

            CarCost(vehicle: vehicle, fareCategory: filterBody.fareCategory),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

            ProviderDetails(vehicle: vehicle),
            SizedBox(height: 100)
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: kElevationToShadow[4],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: context.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'total'.tr + ': ',
                          style: cairoRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge.color.withOpacity(.4),
                          ),),
                        Text(
                          '${filterBody.distance}km',
                          style: cairoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge.color.withOpacity(.4)),
                        ),

                      ],
                    ),
                    Text(
                      PriceConverter.convertPrice(filterBody.distance * (filterBody.fareCategory == 'hourly' ? vehicle.insidePerHourCharge : vehicle.insidePerKmCharge)),
                      style: cairoMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              CustomButton(
                width: 140,
                fontSize: Dimensions.fontSizeDefault,
                onPressed: () => Get.toNamed(RouteHelper.getBookingCheckoutScreen(vehicle, filterBody)),
                buttonText: 'rent_this_car'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
