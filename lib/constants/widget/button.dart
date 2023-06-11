import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum ButtonType { normal, transparent, emailbutton }

//Custom button for our app
class Button extends ConsumerWidget {
  const Button(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.iconName,
      this.buttonType = ButtonType.normal,
      zz});

  final VoidCallback onPressed;
  final String buttonText;
  final ButtonType? buttonType;
  final String? iconName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //if button type email and has icon
    if (buttonType == ButtonType.emailbutton) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconName ?? "",
          height: 24.h,
          width: 24.w,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48.0.h),
          backgroundColor: Color(0xffE6353A),
          // backgroundColor: currentTheme.drawerTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xffE6353A),
              // color: currentTheme.appBarTheme.iconTheme!.color!,
            ),
            borderRadius: BorderRadius.circular(24.0.r),
          ),
        ),
        label: Text(
          buttonText,
          style: TextStyle(
              // fontFamily:currentTheme.textTheme.bodyText1!.fontFamily ,

              fontSize: 14.0.sp,
              color: Color(0xffE6353A)),
          // color: currentTheme.appBarTheme.iconTheme!.color!),
        ),
      );
    }

    //if button type is normal or transparent
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffE6353A),
        // backgroundColor: buttonType == ButtonType.normal
        //     ? Pallete.primaryColor
        //     : currentTheme.drawerTheme.backgroundColor,
        minimumSize: Size(double.infinity, 48.0.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xffE6353A),
          ),
          borderRadius: BorderRadius.circular(24.0.r),
        ),
      ),
      child: Text(
        buttonText,
        style: buttonType == ButtonType.transparent
            ? TextStyle(
                // fontFamily:currentTheme.textTheme.bodyText1!.fontFamily ,

                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xffE6353A))
            // color: Pallete.primaryColor)
            : TextStyle(
                // fontFamily:currentTheme.textTheme.bodyText1!.fontFamily ,

                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
      ),
    );
  }
}

class newButton extends StatelessWidget {
  const newButton({
    Key? key,
    required this.onPressed,
    this.width,
    this.height,
    required this.color,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.sp,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
      ),
    );
  }
}
