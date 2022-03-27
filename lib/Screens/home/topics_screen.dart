// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../core/model/model.dart';
import '../../utils/colors.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

List<MenuModel> _menuItem = [
  MenuModel(text: "My 15", isSelected: true),
  MenuModel(text: "Location", isSelected: false),
  MenuModel(text: "Date", isSelected: false),
  MenuModel(text: "View", isSelected: false),
];

class _TopicScreenState extends State<TopicScreen> {
  int? _selectedItem;
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
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2.5,
                ),
                itemCount: _menuItem.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedItem = index;
                      });
                    },
                    child: MenuItem(
                      index: index,
                      selectedTab: _selectedItem ?? 0,
                      title: _menuItem[index].text,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.selectedTab,
    required this.title,
    required this.index,
  }) : super(key: key);

  final int selectedTab;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: selectedTab == index ? AppColors.kLime : AppColors.ksgrey,
        borderRadius: BorderRadius.circular(kPad),
      ),
      child: Center(
          child: Text(title,
              style: bodySmallText(context)
                  .copyWith(color: AppColors.kwhite, fontSize: 11))),
    );
  }
}

