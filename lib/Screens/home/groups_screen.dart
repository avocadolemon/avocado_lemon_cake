// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
// import 'package:avocado_lemon_cake/utils/assets_manager.dart.dart';
import 'package:flutter/material.dart';
import '../../core/model/model.dart';
import '../../utils/colors.dart';
import 'components/my_group_slide.dart';

List<MyGroup> groupList = [
  MyGroup(image: ImageAssets.wh, name: "Group Name, Neigbourhood", count: "5"),
  MyGroup(image: ImageAssets.city, name: "Group Name, Texas", count: "4"),
  MyGroup(image: ImageAssets.wh, name: "Group Name, Neigbourhood", count: "5"),
  MyGroup(image: ImageAssets.city, name: "Group Name, Texas", count: "4"),
  MyGroup(image: ImageAssets.wh, name: "Group Name, Neigbourhood", count: "5"),
  MyGroup(image: ImageAssets.city, name: "Group Name, Texas", count: "4"),
];

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  bool firstTab = true;
  bool secondTab = false;
  bool thirdTab = false;
  bool fourthTab = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        kMediumVerticalSpacing,
        _buildTabHeader(context),
        kSmallVerticalSpacing,
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: kPad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "MY GROUPS (5)",
                      style: bodySmallText(context).copyWith(
                          color: AppColors.kwhite, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star_border,
                      color: AppColors.kprimary,
                      size: 14,
                    )
                  ],
                ),
                kMediumVerticalSpacing,
                buildSlider(size),
                kLargeVerticalSpacing,
                Row(
                  children: [
                    Text(
                      "MY GROUPS (5)",
                      style: bodySmallText(context).copyWith(
                          color: AppColors.kwhite, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star_border,
                      color: AppColors.kprimary,
                      size: 14,
                    )
                  ],
                ),
                kMediumVerticalSpacing,
                buildSlider(size),
                kLargeVerticalSpacing,
                Row(
                  children: [
                    Text(
                      "MY GROUPS (5)",
                      style: bodySmallText(context).copyWith(
                          color: AppColors.kwhite, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star_border,
                      color: AppColors.kprimary,
                      size: 14,
                    )
                  ],
                ),
                kMediumVerticalSpacing,
                buildSlider(size),
              ],
            ),
          ),
        ))
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
                          fourthTab = false;
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
                        child: Center(
                            child: Text("Travel",
                                style: bodySmallText(context).copyWith(
                                    color: AppColors.kwhite, fontSize: 8))),
                      ),
                    ),
                    kTinyHorizontalSpacing,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          firstTab = false;
                          secondTab = true;
                          thirdTab = false;
                          fourthTab = false;
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
                            child: Text("Travel",
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
                          fourthTab = false;
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
                            child: Text("Travel",
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
                          thirdTab = false;
                          fourthTab = true;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: fourthTab == true
                              ? AppColors.kLime
                              : AppColors.ksgrey,
                          borderRadius: BorderRadius.circular(kPad),
                        ),
                        child: Center(
                            child: Text("Travel",
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

  Container buildSlider(Size size) {
    return Container(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: groupList.length,
          itemBuilder: (_, index) {
            return MyGroupSlide(
              count: groupList[index].count,
              image: groupList[index].image,
              text: groupList[index].name,
              size: size,
            );
          }),
    );
  }
}
