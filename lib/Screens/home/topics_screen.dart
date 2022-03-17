// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
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
            padding: EdgeInsets.symmetric(vertical: kPad, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.ksgrey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.kwhite,
                          ),
                          kTinyHorizontalSpacing,
                          Text(
                            "Neighbourhoods",
                            style: bodyNormalText(context)
                                .copyWith(color: AppColors.kwhite),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.kprimary,
                        ),
                        kTinyHorizontalSpacing,
                        Text(
                          "|",
                          style: bodyNormalText(context)
                              .copyWith(color: AppColors.kwhite, fontSize: 10),
                        ),
                        kTinyHorizontalSpacing,
                        Icon(
                          Icons.notifications_outlined,
                          size: 18,
                          color: AppColors.kprimary,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Topic name",
                      style: bodySmallText(context)
                          .copyWith(color: AppColors.kwhite),
                    ),
                    kTinyHorizontalSpacing,
                    Text(
                      "|",
                      style: bodyNormalText(context)
                          .copyWith(color: AppColors.kwhite, fontSize: 10),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 14,
                      ),
                      kTinyHorizontalSpacing,
                      Text(
                        "35",
                        style: bodyNormalText(context)
                            .copyWith(color: AppColors.kwhite, fontSize: 10),
                      )
                    ]),
                    kTinyHorizontalSpacing,
                    Text(
                      "|",
                      style: bodyNormalText(context)
                          .copyWith(color: AppColors.kwhite, fontSize: 10),
                    ),
                    kTinyHorizontalSpacing,
                    Text(
                      "17.20.2022",
                      style: bodyTinyText(context)
                          .copyWith(color: AppColors.kwhite),
                    ),
                  ],
                )
              ],
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
                          child: Text("Location",
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
                          child: Text("Date",
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
                          child: Text("View",
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
