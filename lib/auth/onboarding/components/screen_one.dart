// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingContent extends StatefulWidget {
  final String image;
  final String heading;
  final String paragraph;
  final double? height;
  const OnboardingContent(
      {Key? key,
      required this.image,
      required this.heading,
      required this.paragraph,
      this.height = 200.0})
      : super(key: key);

  @override
  _OnboardingContentState createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            SvgPicture.asset(
              widget.image,
              height: widget.height,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Text(
                widget.heading,
                style: heading1(context)
                    .copyWith(color: AppColors.kwhite, fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 22),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                widget.paragraph,
                textAlign: TextAlign.center,
                style: bodyNormalText(context).copyWith(
                  color: AppColors.kwhite.withOpacity(0.7),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    ));
  }
}
