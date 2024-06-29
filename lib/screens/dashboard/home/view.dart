import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/api_utilities.dart';
import 'package:gurniturerenting/utils/c_loading.dart';
import 'package:gurniturerenting/widgets/c_appbar.dart';
import 'package:gurniturerenting/widgets/c_internet_checker_widget.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';


import 'provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  HomeProvider? provider;
  Flutter3DController controller = Flutter3DController();

  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchFurnitureItems();
    // provider.initializeLocalNotifications();
    // provider.configureFirebaseMessaging();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // provider?.disposeData();
    });
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: CDashboardAppBar(
        title: "Dashboard",
        backButtonVisible: false,
        action: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.notificationPage);
            },
            icon: SvgPicture.asset(Assets.iconsNotification)),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return InternetConnectionChecker(
              onRefresh: () {
                provider.fetchFurnitureItems();
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0).r,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 70.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        15.h.heightBox,
                        provider.furnitureListModel == null
                            ? SizedBox(
                          height: context.screenHeight / 1.4,
                          child: customLoading(),
                        )
                            : provider.furnitureListModel!.furnitureListings!.isEmpty
                            ? Padding(
                          padding: EdgeInsets.only(top: 150.0.h),
                          child: const Center(
                            child: CSemiBoldText(
                              text: "Data not found",
                              color: Vx.gray400,
                            ),
                          ),
                        )
                            :GridView.builder(
                          itemCount: provider.furnitureListModel!.furnitureListings!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 10, // Space between columns
                            mainAxisSpacing: 10, // Space between rows
                            childAspectRatio: 0.80, // Adjust based on the aspect ratio you want
                          ),
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRouter.detailsPage,
                                    arguments: json.encode(provider.furnitureListModel!.furnitureListings![i]),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Vx.gray200, width: 1),
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Container(
                                            height: 150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Flutter3DViewer(
                                              //If you don't pass progressBarColor the color of defaultLoadingProgressBar will be grey.
                                              //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                                              progressBarColor: Colors.blue,
                                              controller: controller,
                                              src: "${provider.furnitureListModel!.furnitureListings![i].imageUrl}", //3D model with different animations
                                              //src: 'assets/sheen_chair.glb', //3D model with different textures
                                              //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                                            )


                                            // CachedNetworkImage(
                                            //   imageUrl: "${provider.furnitureListModel!.furnitureListings![i].imageUrl}",
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "${provider.furnitureListModel!.furnitureListings![i].name}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          provider.furnitureListModel!.furnitureListings![i].availabilityStatus!,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          "\$${provider.furnitureListModel!.furnitureListings![i].rentalPricePerMonth ?? "0"} / month",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )

                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
