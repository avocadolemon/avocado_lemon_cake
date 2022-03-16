// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool firstTab = true;
  bool secondTab = false;
  bool thirdTab = false;
  bool fourthTab = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        kMediumVerticalSpacing,
        _buildTabHeader(context),
        kLargeVerticalSpacing,
        Container(
          margin: EdgeInsets.symmetric(horizontal: kPad),
          padding: EdgeInsets.symmetric(vertical: kPad),
          decoration: BoxDecoration(
            color: AppColors.ksgrey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child : Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(ImageAssets.profile),
                  backgroundColor: AppColors.kblack,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tzvika lahav".toUpperCase(), style: bodyNormalText(context).copyWith(color: AppColors.kwhite, fontSize: 18.sp),),
                    kTinyVerticalSpacing,
                    Text("This is my important status", style: bodySmallText(context).copyWith(color: Color.fromARGB(255, 250, 130, 170).withOpacity(0.6)),),
                    kTinyVerticalSpacing,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.camera_alt_outlined, size: 14, color: AppColors.kwhite.withOpacity(0.7),),
                            kTinyHorizontalSpacing,
                            Text("3 Photos", style: bodySmallText(context).copyWith(color: AppColors.kwhite.withOpacity(0.7)),)
                          ],
                        ),
                        kMediumHorizontalSpacing,
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 14, color: AppColors.kwhite.withOpacity(0.7),),
                              kTinyHorizontalSpacing,
                              Text("Jerusalem", style: bodySmallText(context).copyWith(color: AppColors.kwhite.withOpacity(0.7)),)
                            ],
                          ),
                        )
                      ],
                    )
                  ]
                ),
              )
            ],
          )
        )
      ],
    ));
  }

  Padding _buildTabHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPad),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.ksgrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 18,
                  color: AppColors.kwhite,
                )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstTab = true;
                        secondTab = false;
                        thirdTab = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: firstTab == true
                            ? AppColors.kLime
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Row(
                        children: [
                          Text("My 15 ",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8)),
                          Icon(
                            Icons.star,
                            color: AppColors.kprimary,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  kTinyHorizontalSpacing,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstTab = false;
                        secondTab = true;
                        thirdTab = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: secondTab == true
                            ? AppColors.kLime
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("Neighbourhood",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  kTinyHorizontalSpacing,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstTab = false;
                        secondTab = false;
                        thirdTab = true;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: thirdTab == true
                            ? AppColors.kLime
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("Street",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  kTinyHorizontalSpacing,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
