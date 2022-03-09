import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';

class TabSelect extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  final String thirdTab;
  final String fourthTab;
  final Color bdgColor;
  final Color indicatorColor;
  final Color labelColor;
  final Color inactiveColor;
  final TabController? tabController;
  const TabSelect({
    Key? key,
    required this.firstTab,
    required this.secondTab,
    required this.fourthTab,
    this.bdgColor = Colors.white,
    this.indicatorColor = AppColors.kprimary,
    this.labelColor = Colors.white,
    this.inactiveColor = Colors.white,
    this.tabController,
    required this.thirdTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Center(
          child: Container(
              height: 30.0,
              // margin: const EdgeInsets.symmetric(horizontal: 52),
              decoration: BoxDecoration(
                  // color: bdgColor,
                  // borderRadius: BorderRadius.circular(24),
                  ),
              child: TabBar(
                onTap: (index) {
                  tabController?.animateTo(
                    index,
                  );
                },
                controller: tabController,
                indicator: BoxDecoration(
                    color: AppColors.kprimary,
                    borderRadius: BorderRadius.circular(kPad)),
                labelStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                labelColor: labelColor,
                unselectedLabelColor: inactiveColor,
                tabs: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.ksgrey,
                      ),
                      child: Text(firstTab)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.ksgrey,
                      ),
                      child: Text(secondTab)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.ksgrey,
                      ),
                      child: Text(thirdTab)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.ksgrey,
                      ),
                      child: Text(fourthTab)),
                ],
              )),
        ));
  }
}
