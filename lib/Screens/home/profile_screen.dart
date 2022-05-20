// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:avocado_lemon_cake/widgets/custom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/model.dart';
import '../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<MenuModel> _menuItem = [
  MenuModel(text: "My 15", isSelected: true),
  MenuModel(text: "Neighbourhood", isSelected: false),
  MenuModel(text: "Street", isSelected: false),
];

class _ProfileScreenState extends State<ProfileScreen> {
  bool selectedNeighbourhood = false;
  bool firstTab = true;
  bool secondTab = false;
  bool thirdTab = false;
  bool fourthTab = false;

  var categoryItems = [
    'Andrew John',
    'Samuel Jon',
    'Dickson',
    'Gloria',
    'Gloria',
  ];
  @override
  Widget build(BuildContext context) {
    int? _selectedItem;
    return Scaffold(
        body: Column(
      children: [
        kMediumVerticalSpacing,
        _buildTabHeader(context),
        kLargeVerticalSpacing,
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ProfileManagement');
          },
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: kPad),
              padding: EdgeInsets.symmetric(vertical: kPad),
              decoration: BoxDecoration(
                color: AppColors.ksgrey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
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
                          Text(
                            "Tzvika lahav".toUpperCase(),
                            style: bodyNormalText(context).copyWith(
                                color: AppColors.kwhite, fontSize: 18.sp),
                          ),
                          kTinyVerticalSpacing,
                          Text(
                            "This is my important status",
                            style: bodySmallText(context).copyWith(
                                color: Color.fromARGB(255, 250, 130, 170)
                                    .withOpacity(0.6)),
                          ),
                          kTinyVerticalSpacing,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 14,
                                    color: AppColors.kwhite.withOpacity(0.7),
                                  ),
                                  kTinyHorizontalSpacing,
                                  Text(
                                    "3 Photos",
                                    style: bodySmallText(context).copyWith(
                                        color:
                                            AppColors.kwhite.withOpacity(0.7)),
                                  )
                                ],
                              ),
                              kMediumHorizontalSpacing,
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                      color: AppColors.kwhite.withOpacity(0.7),
                                    ),
                                    kTinyHorizontalSpacing,
                                    Text(
                                      "Jerusalem",
                                      style: bodySmallText(context).copyWith(
                                          color: AppColors.kwhite
                                              .withOpacity(0.7)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ]),
                  )
                ],
              )),
        )
      ],
    ));
  }

  Padding _buildTabHeader(BuildContext context) {
    int? _selectedItem;
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
            // Expanded(
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     // scrollDirection: Axis.horizontal,
            //     physics: NeverScrollableScrollPhysics(),
            //     padding: EdgeInsets.all(8),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       childAspectRatio: 2.5,
            //     ),
            //     itemCount: _menuItem.length,
            //     itemBuilder: (_, index) {
            //       return InkWell(
            //         onTap: () {
            //           setState(() {
            //             _selectedItem = index;
            //           });
            //         },
            //         child: ProfileItem(
            //            index: index,
            //           selectedTab: _selectedItem ?? 0,
            //           title: _menuItem[index].text,
            //         )                  
            //       );
            //     },
            //   ),
            // ),
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
                                  color: AppColors.kwhite, fontSize: 11)),
                          Icon(
                            Icons.star,
                            color: AppColors.kprimary,
                            size: 11,
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
                      CustomModal.showModal(
                          context: context,
                          childWidget:
                              _buildCategoryData(context, "Neighbourhood"));
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
                                  color: AppColors.kwhite, fontSize: 11))),
                    ),
                  ),
                  kTinyHorizontalSpacing,
                  GestureDetector(
                    onTap: () {
                      CustomModal.showModal(
                          context: context,
                          childWidget: _buildCategoryData(context, "Street"));
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
                                  color: AppColors.kwhite, fontSize: 11))),
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

  Widget _buildCategoryData(BuildContext context, String title) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kLargeVerticalSpacing,
      kLargeVerticalSpacing,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style:
              heading1(context).copyWith(color: AppColors.kblack, fontSize: 20),
        ),
      ),
      kLargeVerticalSpacing,
      Expanded(
        child: ListView.separated(
            itemCount: categoryItems.length,
            separatorBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: AppColors.kblack.withOpacity(0.4),
                ),
              );
            },
            itemBuilder: (context, index) {
              return BuildTile(
                index: index,
                categoryItems: categoryItems,
              );
            }),
      )
    ]);
  }
}

class BuildTile extends StatefulWidget {
  const BuildTile({
    Key? key,
    required this.categoryItems,
    required this.index,
  }) : super(key: key);

  final List<String> categoryItems;
  final int index;

  @override
  State<BuildTile> createState() => _BuildTileState();
}

class _BuildTileState extends State<BuildTile> {
  bool selectedNeighbourhood = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedNeighbourhood = !selectedNeighbourhood;
          print(selectedNeighbourhood);
        });
      },
      child: ListTile(
        leading: Text(
          widget.categoryItems[widget.index],
          style: bodyTinyText(context).copyWith(fontSize: 14),
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              selectedNeighbourhood == false
                  ? Icons.circle_outlined
                  : Icons.circle,
              color: AppColors.kblack,
              size: 22,
            )),
      ),
    );
  }
}


class ProfileItem extends StatelessWidget {
  const ProfileItem({
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: selectedTab == index ? AppColors.kLime : AppColors.ksgrey,
        borderRadius: BorderRadius.circular(kPad),
      ),
      child: Center(
          child: Text(title,
              style:
                  bodyNormalText(context).copyWith(color: AppColors.kwhite))),
    );
  }
}

