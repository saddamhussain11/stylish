import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/res/constant/appcolors.dart';

class CustomTextfield extends StatefulWidget {
  final String labeltext;
  final TextInputType inputType;

  final Color color;
  final IconData? iconData;
  final bool showSuffixIcon;
  final Color? borderColor;
  final double? width;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? sufixicon;
  final bool? border;
  final bool? readonly;
  final BorderRadius? borderRadius;

  CustomTextfield({
    super.key,
    required this.color,
    required this.labeltext,
    required this.inputType,
    this.iconData,
    this.showSuffixIcon = false,
    this.borderColor,
    this.width,
    this.controller,
    this.validator,
    this.sufixicon,
    this.border,
    this.readonly,
    this.borderRadius,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool isvisible;

  @override
  void initState() {
    isvisible = widget.showSuffixIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.showSuffixIcon ? isvisible : false,
      controller: widget.controller,
      keyboardType: widget.inputType,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      readOnly: widget.readonly ?? false,
      style: TextStyle(color: Appcolors.blackColor, fontSize: 16.sp),
      validator: widget.validator,
      decoration: InputDecoration(
        fillColor: widget.color,
        filled: true,
        prefixIcon: widget.iconData != null
            ? Icon(
                widget.iconData,
                color: Appcolors.blackColor,
                size: 24.sp,
              )
            : null,
        suffixIcon: widget.showSuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isvisible = !isvisible;
                  });
                },
                icon: Icon(
                  isvisible ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.sufixicon,
        hintText: widget.labeltext,
        hintStyle: TextStyle(color: Appcolors.blackColor, fontSize: 16.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Appcolors.blackColor, width: 0.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Appcolors.blackColor, width: 0.5.w),
        ),
      ),
    );
  }
}
