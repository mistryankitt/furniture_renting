import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gurniturerenting/generated/assets.dart';
import 'package:gurniturerenting/screens/routes.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/c_appbar.dart';
import 'package:gurniturerenting/widgets/c_button.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/c_textfield.dart';
import 'package:gurniturerenting/widgets/constants.dart';

import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TextEditingControllerVariables.emailTextEditingControllerSignIn.clear();
      TextEditingControllerVariables.passTextEditingControllerSignIn.clear();
    });
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return Container(
      height: mediaHeight(context),
      width: mediaWidth(context),
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //     fit: BoxFit.fill, image: AssetImage(Assets.assetsLogo)),
        gradient: LinearGradient(colors: [
          // Color(0xFFFCBF80),
          Color(0xFFFFFDFA),
          Color(0xFFFFFDFA),
          Color(0xFFFFFDFA),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CAppBar(
          title: "Sign in",
        ),
        body: Consumer<SignInProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: mediaHeight(context) - 120,
                    maxWidth: mediaWidth(context)),
                child: Column(
                  children: [
                    Expanded(child: Image.asset(Assets.assetsLogo,colorBlendMode:BlendMode.darken)),
                    Container(
                      margin: const EdgeInsets.all(14),
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
                          key: VariableUtilities.globalFormKeys.formKeySignIn,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CBOLDText(
                                text: "Sign In",
                                minFontSize: 23,
                              ),
                              20.heightBox,
                              CTextFieldWidget(
                                hintText: "Email",
                                validator: emailValidation(),
                                keyboardTypeValidation:
                                    TextInputType.emailAddress,
                                myControllers: TextEditingControllerVariables
                                    .emailTextEditingControllerSignIn,
                              ),
                              15.heightBox,
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
                                    .passTextEditingControllerSignIn,
                              ),
                              10.h.heightBox,
                              CustomButtonWidget(
                                  text: "Sign in",
                                  onTap: () {
                                    provider.signInM();
                                  }),
                              10.h.heightBox,


                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
