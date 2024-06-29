import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/auth/sign_in/provider.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/c_appbar.dart';
import 'package:gurniturerenting/widgets/c_button.dart';
import 'package:gurniturerenting/widgets/c_checkbox.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/c_textfield.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final p = Provider.of<SignUpProvider>(navigatorKey.currentContext!,
          listen: false);
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TextEditingControllerVariables.firstNameTextEditingController.clear();
      TextEditingControllerVariables.lastNameTextEditingController.clear();
      TextEditingControllerVariables.emailTextEditingControllerSignup.clear();
      TextEditingControllerVariables.phoneNumberTextEditingController.clear();
      TextEditingControllerVariables.passTextEditingController.clear();
    });

    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    // final provider = context.read<SignUpProvider>();
    return Container(
      height: mediaHeight(context),
      width: mediaWidth(context),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFB0ADBE),
            Color(0xFFFFFDFA),
            Color(0xFFFFFDFA),
            Color(0xFFFFFDFA),
            Color(0xFFB0ADBE),
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          )
        // image: DecorationImage(
        //     fit: BoxFit.fill, image: AssetImage(Assets.assetsLogo)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CAppBar(
          title: "Sign up",
        ),
        body: Consumer<SignUpProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // ConstrainedBox(
                  //     constraints:
                  //         BoxConstraints.expand(height: 150.h, width: 100.w),
                  //     child: SvgPicture.asset(Assets.iconsLogoOrange)),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Vx.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: inputGrayText.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 50)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Form(
                          key: VariableUtilities.globalFormKeys.formKeySignUp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CBOLDText(
                                text: "Create new account",
                                minFontSize: 23,
                              ),
                              20.heightBox,
                              Row(
                                children: [
                                  Expanded(
                                    child: CTextFieldWidget(
                                      hintText: "First name",
                                      validator: firstnameValidation(),
                                      keyboardTypeValidation:
                                          TextInputType.text,
                                      myControllers:
                                          TextEditingControllerVariables
                                              .firstNameTextEditingController,
                                    ),
                                  ),
                                  8.widthBox,
                                  Expanded(
                                    child: CTextFieldWidget(
                                      hintText: "Last name",
                                      validator: lastnameValidation(),
                                      keyboardTypeValidation:
                                          TextInputType.text,
                                      myControllers:
                                          TextEditingControllerVariables
                                              .lastNameTextEditingController,
                                    ),
                                  ),
                                ],
                              ),
                              6.heightBox,
                              CTextFieldWidget(
                                hintText: "Email",
                                validator: emailValidation(),
                                keyboardTypeValidation:
                                    TextInputType.emailAddress,
                                myControllers: TextEditingControllerVariables
                                    .emailTextEditingControllerSignup,
                              ),
                              6.heightBox,
                              CTextFieldWidget(
                                hintText: "Phone number",
                                validator: numberValidation(),
                                keyboardTypeValidation: TextInputType.number,
                                myControllers: TextEditingControllerVariables
                                    .phoneNumberTextEditingController,
                              ),
                              6.heightBox,
                              CTextFieldWidget(
                                hintText: "Password",
                                validator: passValidation(),
                                isSuffixIcon: true,
                                textSecure: provider.isVisible,
                                suffixIconString: provider.isVisible
                                    ? Assets.imagesInvisible
                                    : Assets.imagesVisible,
                                onPressedSuffixIcon: () {
                                  provider.passIsVisible();
                                },
                                myControllers: TextEditingControllerVariables
                                    .passTextEditingController,
                              ),
                           10.heightBox,

                              CustomButtonWidget(
                                  text: "Sign Up",
                                  onTap: () {
                                    provider.signUpM();
                                  }),

                              10.heightBox,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
