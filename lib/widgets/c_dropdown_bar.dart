import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:gurniturerenting/widgets/constants.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<DropdownMenuItem<String>>? dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = const Offset(0, 0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: value,
        items: dropdownItems,
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40.h,
          width: buttonWidth ?? 140.w,
          padding: buttonPadding ?? const EdgeInsets.only(left: 14, right: 10),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: inputGrayBorder,
                ),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ??
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.black45,
              ),
          iconSize: iconSize ?? 30.sp,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? 200.h,
          width: dropdownWidth ?? 140.w,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
          elevation: dropdownElevation ?? 2,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          //Default is false to show menu below button
          isOverButton: false,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40.sp,
          padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

class CustomDropDownWidget extends StatelessWidget {
  List<DropdownMenuItem<Object>>? items;
  String? emptyValidationString;
  String? hintString;
  Object? value;
  Function(Object?)? onChanged;

  CustomDropDownWidget(
      {Key? key,
      this.items,
      this.emptyValidationString,
      this.onChanged,
      this.hintString,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,

        contentPadding: EdgeInsets.zero,

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: inputGrayBorder)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: CNORMALText(
        text: hintString ?? "",
        minFontSize: 14.sp,
        color: Colors.black38,
      ),

      items: items,
      value: value,
      validator: (value) {
        if (value == null) {
          return 'Please select $emptyValidationString.';
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: (value) {
        // selectedValue = value.toString();
      },

      buttonStyleData: ButtonStyleData(
        height: 50.h,
        padding: const EdgeInsets.only(left: 0, right: 10),
      ),
      iconStyleData: IconStyleData(
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.black45,
        ),
        iconSize: 30.sp,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

    );
  }
}
