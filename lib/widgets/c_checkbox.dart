import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gurniturerenting/widgets/constants.dart';

class RoundedCheckbox extends StatefulWidget {
  final Function(bool)? onChanged;
  bool? isTrue;


  RoundedCheckbox({
   required this.onChanged,  this.isTrue,
  });

  @override
  State<RoundedCheckbox> createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {


  changeValue(){
    setState(() {
      widget.onChanged!(widget.isTrue!);
      log("${widget.isTrue}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.isTrue = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.isTrue = false;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeValue();
      },
      child: ClipRRect(
        child: Container(
          height: 24.0,
          width: 24.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.isTrue == true
                ? primary
                : Colors.transparent,
            border: Border.all(
              color: widget.isTrue == true
                  ? primary
                  : footerGrayTab.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          child: widget.isTrue == true
              ? const Icon(
            Icons.check,
            size: 16.0,
            color: Colors.white,
          )
              : null,
        ),
      ),
    );
  }
}
