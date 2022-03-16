import 'package:avocado_lemon_cake/screens/home/groups_screen.dart';
import 'package:avocado_lemon_cake/screens/home/profile_screen.dart';
import 'package:avocado_lemon_cake/screens/home/topics_screen.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/app_spacing.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (BuildContext context) {
        final int index = DefaultTabController.of(context)!.index;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: TabBar(
                indicatorColor: AppColors.kLime,
                indicatorWeight: 2,
                // BoxDecoration(
                //     color: AppColors.kprimary,
                //     borderRadius: BorderRadius.circular(kPad)),
                tabs: [
                  Tab(
                      child: Text(
                    "Groups(0)",
                    style: bodyNormalText(context)
                        .copyWith(color: AppColors.kwhite),
                  )),
                  Tab(
                      child: Text(
                    "Profile(5)",
                    style: bodyNormalText(context)
                        .copyWith(color: AppColors.kwhite),
                  )),
                  Tab(
                      child: Stack(
                    children: [
                      Text(
                        "Topics",
                        style: bodyNormalText(context)
                            .copyWith(color: AppColors.kwhite),
                      ),
                      Positioned(
                          bottom: 0,
                          right: -3,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text("5", style: bodyTinyText(context).copyWith(color: AppColors.kwhite),),
                          ))
                    ],
                  )),
                ],
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  // padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.ksgrey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.home_filled,
                    color: AppColors.kwhite,
                    size: 16,
                  )
                  // child: ,
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: kPad),
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                            color: AppColors.kwhite,
                          ),
                          Text(
                            "musi".toUpperCase(),
                            style: bodySmallText(context)
                                .copyWith(color: AppColors.kwhite),
                          )
                        ],
                      ),
                    ),
                    kSmallHorizontalSpacing,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.kLime,
                        borderRadius: BorderRadius.circular(kPad),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 16,
                            color: AppColors.kwhite,
                          ),
                          kTinyHorizontalSpacing,
                          Text(
                            "Travel with Kids",
                            style: bodySmallText(context)
                                .copyWith(color: AppColors.kwhite),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: const TabBarView(
            children: [
              GroupScreen(),
              ProfileScreen(),
              TopicScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.kLime,
              onPressed: () {
                Navigator.pushNamed(context, '/addToGroup');
              },
              child: const Icon(
                Icons.add,
                color: AppColors.kwhite,
                size: 40,
              )),
        );
      }),
    );
  }
}
