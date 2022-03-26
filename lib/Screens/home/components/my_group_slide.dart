// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/app_spacing.dart';
import '../../../utils/app_textstyle.dart';
import '../../../utils/colors.dart';


class MyGroupSlide extends StatelessWidget {
  final String image;
  final String text;
  final String count;
  const MyGroupSlide({
    Key? key,
    required this.size, required this.image, required this.text, required this.count,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.only(right: kPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 180,
                  width: size.width*0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Row(
                children: [
                  Icon(Icons.notifications_outlined, size: 14, color: AppColors.kprimary,),
                  kTinyHorizontalSpacing,
                  Text("|", style: bodyNormalText(context).copyWith(color: AppColors.kwhite, fontSize: 6),),
                  kTinyHorizontalSpacing,
                  Text("7", style: bodySmallText(context).copyWith(color: AppColors.kwhite),),
                  kTinyHorizontalSpacing,
                  Icon(Icons.people_rounded, size: 14, color: AppColors.kprimary,),
                ],
              )),
               Positioned(
                  top: -1,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(count, style: bodyTinyText(context).copyWith(color: AppColors.kwhite),),
                  ))
            ],
          ),
          kSmallVerticalSpacing,
          Text(text, style: bodyNormalText(context).copyWith(color: AppColors.kwhite.withOpacity(0.8)),)
        ],
      ),
    );
  }
}
