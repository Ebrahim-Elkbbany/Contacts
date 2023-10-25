import 'package:contacts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      this.onPressed,
       this.height,
       this.width,
       this.radius, this.backColor, this.textColor,
      })
      : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final double ?height;
  final double ?width;
  final double ?radius;
  final Color? backColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ??45.h,
      width: width?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backColor?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? 16.w,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: Styles.textStyle16.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
