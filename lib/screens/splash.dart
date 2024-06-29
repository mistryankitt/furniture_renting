import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/splash_provider.dart';
import 'package:gurniturerenting/utils/c_loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<SplashProvider>();
    return Scaffold(
      key: provider.scaffoldKey,
      body: FutureBuilder(
          future: provider.loadSplashScreen(),
          builder: (context, snap) {
            return Stack(
              children: [
                // Center(
                //   child: Image.asset(
                //     Assets.imagesBg,
                //     width: double.infinity,
                //     height: double.infinity,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   child: customLoading(),
                // )
                Center(child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(Assets.assetsLogo),
                )),
              ],
            );
          }),
    );
  }
}
