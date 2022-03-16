// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/core/model/city_model.dart';
import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../utils/app_textstyle.dart';
import '../../utils/colors.dart';
import 'components/community_block.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key? key}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool all = false;
  bool different = false;
  bool myCommunity = false;
  bool popular = false;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAPpBar(context),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        all = true;
                        different = false;
                        myCommunity = false;
                        popular = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color:
                            all == true ? AppColors.kprimary : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("All",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        all = false;
                        different = true;
                        myCommunity = false;
                        popular = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: different == true
                            ? AppColors.kprimary
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("Different",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        all = false;
                        different = false;
                        myCommunity = true;
                        popular = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: myCommunity == true
                            ? AppColors.kprimary
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("My Communities",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        all = false;
                        different = false;
                        myCommunity = false;
                        popular = true;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: popular == true
                            ? AppColors.kprimary
                            : AppColors.ksgrey,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Center(
                          child: Text("Popular",
                              style: bodySmallText(context).copyWith(
                                  color: AppColors.kwhite, fontSize: 8))),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            kSmallVerticalSpacing,
            Expanded(
                child: ListView.builder(
                    itemCount: communityList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: kPad),
                            child: CommunityBlock(
                                image: communityList[index].image,
                                city: communityList[index].cityName,
                                subCity: communityList[index].citySubName),
                          ));
                    })),
            kLargeVerticalSpacing,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              // height: 50,
              decoration: BoxDecoration(
                  color: AppColors.kprimary,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  "Dummy Next",
                  style: heading1(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAPpBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text("Add a Community",
          style: heading1(context).copyWith(color: AppColors.kwhite)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.ksgrey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_city,
                color: AppColors.kwhite,
                size: 14,
              )
              // child: ,
              ),
        )
      ],
    );
  }
}
