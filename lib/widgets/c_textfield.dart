import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gurniturerenting/widgets/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class CTextFieldWidget extends StatefulWidget {
  final String? helperText;
  final String hintText;
  final TextInputType? keyboardTypeValidation;
  final onChangedText;
  final maxLengthChar;
  final endIcon;
  final startIcon;
  final textCapitalization;
  final isErrorValid;
  final maxLines;
  final enableBorder;
  final focusNode;
  final autofillHints;
  final textSecure;
  final prefixIconString;
  final suffixIconString;
  final myControllers;
  final FormFieldValidator<String>? validator;
  final isSuffixIcon;
  final onEditingComplete;
  final focusBorder;
  final initialValue;
  final readOnly;
  final onPressedSuffixIcon;

  const CTextFieldWidget({
    this.helperText,
    required this.hintText,
    this.isErrorValid,
    this.readOnly = false,
    this.keyboardTypeValidation,
    this.maxLengthChar,
    this.myControllers,
    this.onChangedText,
    this.endIcon,
    this.startIcon,
    this.enableBorder,
    this.textCapitalization,
    this.maxLines,
    this.focusNode,
    this.focusBorder,
    this.validator,
    this.prefixIconString,
    this.initialValue,
    this.textSecure = false,
    this.autofillHints,
    this.onEditingComplete,
    this.isSuffixIcon = false,
    this.suffixIconString = false,
    this.onPressedSuffixIcon,
  });

  @override
  _CTextFieldWidgetState createState() => _CTextFieldWidgetState();
}

class _CTextFieldWidgetState extends State<CTextFieldWidget> {
  final bool autoCorrect = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      validator: widget.validator,
      controller: widget.myControllers,
      autofillHints: widget.autofillHints,
      autocorrect: false,
      keyboardType: widget.keyboardTypeValidation,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
          fillColor: widget.readOnly == true ? Vx.gray100 : Colors.white,
          filled: widget.readOnly == true ? true : false,
          hintText: widget.hintText,
          errorText: widget.isErrorValid,
          helperText: widget.helperText,
          // prefixIcon: IconButton(
          //   icon: widget.prefixIconString == null
          //       ? Container()
          //       : Image.asset(
          //           widget.prefixIconString,
          //           width: 20,
          //           //color: cyan,
          //         ),
          //   onPressed: null,
          // ),
          contentPadding: const EdgeInsets.all(16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: inputGrayBorder, width: 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: inputGrayBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: inputGrayBorder, width: 1)),
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
                  constraints: BoxConstraints.tight(Size.zero),
                  icon: Image.asset(
                    widget.suffixIconString,
                    width: 20,
                    //color: cyan,
                  ),
                  onPressed: widget.onPressedSuffixIcon,
                )
              : null,
          /* suffixIcon: widget.myControllers.text.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    child: Image.asset(
                      widget.iconString,
                      height: 12,
                    ),
                    onTap: () => widget.myControllers.clear(),
                  ),
                )
              : Container(
                  width: 0.0,
                ),*/
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: inputGrayBorder, width: 1)),
          hintStyle:
              const TextStyle(color: Colors.black38, fontFamily: "sfpro")),
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      textCapitalization: TextCapitalization.sentences,
      maxLength: widget.maxLengthChar,
      obscureText: widget.textSecure,
      onChanged: widget.onChangedText,
      maxLines: 1,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
