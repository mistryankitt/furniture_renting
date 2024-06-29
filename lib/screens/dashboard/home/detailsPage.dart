import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/models/dashboard_models/home_models/furniture_list_model.dart';
import 'package:gurniturerenting/screens/dashboard/home/provider.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/c_appbar.dart';
import 'package:gurniturerenting/widgets/c_button.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsPage extends StatefulWidget {

  final String? furnitureListing;

  const DetailsPage(
      {Key? key, this.furnitureListing})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Flutter3DController controller = Flutter3DController();

  @override
  void initState() {
    // TODO: implement initState
    final provider =
    Provider.of<HomeProvider>(navigatorKey.currentContext!, listen: false);
    provider.setModeldata(widget.furnitureListing);

    controller.playAnimation();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    final provider =
    Provider.of<HomeProvider>(navigatorKey.currentContext!, listen: false);
    // provider.getGiftDetailsModel = null;
    controller.resetAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: CDashboardAppBar(
              title: "Furniture Details",
            ),
            body:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: mediaHeight(context) / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:Flutter3DViewer(
                          //If you don't pass progressBarColor the color of defaultLoadingProgressBar will be grey.
                          //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                          progressBarColor: Colors.blue,
                          controller: controller,
                          src: "${provider.furnitureListingM!.imageUrl}", //3D model with different animations
                          //src: 'assets/sheen_chair.glb', //3D model with different textures
                          //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                        )


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CSemiBoldText(
                            text:
                            "${provider.furnitureListingM!.name}",
                            minFontSize: 20.sp,
                            color: primary,
                          ),
                        ],
                      ),
                    ),
                    CSemiBoldText(
                      text:
                      "\$${provider.furnitureListingM!.rentalPricePerMonth}",
                      minFontSize: 16.sp,
                    ),
                    10.heightBox,
                    const CSemiBoldText(text: "About"),
                    10.heightBox,
                    CNORMALText(
                      text:
                      "${provider.furnitureListingM!.description}",
                      color: Vx.gray500,
                    ),
                    10.heightBox,
                    const CSemiBoldText(text: "IsRent available"),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CNORMALText(
                            text:
                            "${provider.furnitureListingM!.availabilityStatus}",
                            color: Vx.gray500,
                          ),
                        ),
                      ],
                    ),

                    10.heightBox,
                    lineDivider,
                    20.heightBox,
                    CustomButtonWidget(text:provider.furnitureListingM!.availabilityStatus == "available" ?  "Buy rent" : "not available", onTap:provider.furnitureListingM!.availabilityStatus == "available" ?  (){} : null),

                    20.heightBox,

                  ],
                ),
              ),
            ));
      },
    );
  }
}
