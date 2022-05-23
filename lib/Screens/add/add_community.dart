import 'package:avocado_lemon_cake/core/model/city_model.dart';
import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/app_textstyle.dart';
import '../../utils/colors.dart';
import '../community/community_screen.dart';
import 'components/community_block.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({Key? key}) : super(key: key);

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  int _isSelected = 0;
  List<int> communit = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAPpBar(context),
      bottomNavigationBar: communit.isNotEmpty
          ? Container(
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kprimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CommunityScreen(communities: communit),
                    ),
                  );
                },
                child: Text("Continue", style: heading1(context)),
              ),
            )
          // ? Container(
          //     height: 100,
          //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          //     color: Colors.transparent,
          //     child: ButtonWidget(
          //       btnName: 'Continue',
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (_) => CommunityScreen(communities: communit),
          //           ),
          //         );
          //       },
          //       enabtn: true,
          //       startLoad: false,
          //     ),
          //   )
          : const Center(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    categBtn('All', () => setState(() => _isSelected = 0), 0),
                    categBtn(
                        'Different', () => setState(() => _isSelected = 1), 1),
                    categBtn('My Communities',
                        () => setState(() => _isSelected = 2), 2),
                    categBtn(
                        'Popular', () => setState(() => _isSelected = 3), 3),
                  ],
                ),
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
                    onTap: () {
                      setState(() {
                        if (communit.contains(communityList[index].id)) {
                          communit.remove(communityList[index].id);
                        } else if (communit.length >= 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(
                                'You cannot select more than six communities.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          communit.add(communityList[index].id as int);
                        }
                        debugPrint(communit.toString());
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPad),
                      child: CommunityBlock(
                        image: communityList[index].image,
                        city: communityList[index].cityName,
                        subCity: communityList[index].citySubName,
                        selected: communit.contains(communityList[index].id)
                            ? true
                            : false,
                      ),
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

  Widget categBtn(String txt, void Function()? onTap, int index) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: _isSelected == index ? AppColors.kprimary : AppColors.ksgrey,
          borderRadius: BorderRadius.circular(kPad),
        ),
        child: Center(
          child: Text(
            txt,
            style: bodySmallText(context).copyWith(color: AppColors.kwhite),
          ),
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
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/community-screen'),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.ksgrey,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_city,
                color: AppColors.kwhite,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
