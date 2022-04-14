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

List<MenuModel> menuItem = [
  MenuModel(text: "Ages 0-5", isSelected: true),
  MenuModel(text: "Ages 5-15", isSelected: false),
  MenuModel(text: "A day trip", isSelected: false),
  MenuModel(text: "Weekend trip", isSelected: false),
  MenuModel(text: "1-3 miles away", isSelected: false),
  MenuModel(text: "Close to home", isSelected: false),
];

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  int? _selectedItem;
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
                kSmallVerticalSpacing,
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
                kSmallVerticalSpacing,
                buildSliderTwo(size),
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
                kSmallVerticalSpacing,
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
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.ksgrey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
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
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8),
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 4,
                  //   childAspectRatio: 2.5,
                  // ),
                  itemCount: menuItem.length,
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
                        title: menuItem[index].text,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSlider(Size size) {
    return Container(
      height: 250,
      child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.85,
          ),
          padEnds: false,
          scrollDirection: Axis.horizontal,
          itemCount: groupList.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/aboutGroup');
              },
              child: MyGroupSlide(
                count: groupList[index].count,
                image: groupList[index].image,
                text: groupList[index].name,
                size: size,
              ),
            );
          }),
    );
  }

  Container buildSliderTwo(Size size) {
    return Container(
      height: 250,
      child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.85,
          ),
          padEnds: false,
          scrollDirection: Axis.horizontal,
          itemCount: groupList.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/groupConversation');
              },
              child: MyGroupSlide(
                count: groupList[index].count,
                image: groupList[index].image,
                text: groupList[index].name,
                size: size,
              ),
            );
          }),
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
      height: 50,
      width: 100,
      // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
