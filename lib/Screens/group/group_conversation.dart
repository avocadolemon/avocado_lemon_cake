// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/model.dart';
import 'components/message_block.dart';

List<AddGroupModel> list = [
  AddGroupModel(image: ImageAssets.profile),
  AddGroupModel(image: ImageAssets.city),
  AddGroupModel(image: ImageAssets.splashBG),
  AddGroupModel(image: ImageAssets.profile),
  AddGroupModel(image: ImageAssets.city),
  AddGroupModel(image: ImageAssets.splashBG),
  AddGroupModel(image: ImageAssets.profile),
  AddGroupModel(image: ImageAssets.city),
  AddGroupModel(image: ImageAssets.splashBG),
  AddGroupModel(image: ImageAssets.profile),
  AddGroupModel(image: ImageAssets.city),
  AddGroupModel(image: ImageAssets.splashBG),
];

class GroupConversation extends StatelessWidget {
  const GroupConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Divider(
              color: AppColors.kwhite.withOpacity(0.8),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.centerRight,
              child: Text(
                "Sed ligula erat, mauris",
                style: bodyNormalText(context)
                    .copyWith(color: AppColors.kwhite, fontSize: 16.sp),
              ),
            ),
            Divider(
              color: AppColors.kwhite,
            ),
            kLargeVerticalSpacing,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPad),
                child: SingleChildScrollView(
                  child: ListView.builder(
                      itemCount: 12,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return MessageBlock(
                          image: list[index].image,
                        );
                      }),
                ),
              ),
            ),
            _chatInputField(context)
          ],
        ),
      ),
    );
  }

  Container _chatInputField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.ksgrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: AppColors.kwhite.withOpacity(0.8),
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: "Type your message",
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: bodyTinyText(context).copyWith(
                            color: AppColors.kwhite.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.kwhite.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kprimary),
              child: Icon(
                Icons.send,
                color: AppColors.kblack,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kPad, vertical: kPad),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.star_border,
            color: AppColors.kprimary,
          ),
          kTinyHorizontalSpacing,
          Icon(
            Icons.notifications_none_outlined,
            color: AppColors.kprimary,
          ),
          kTinyHorizontalSpacing,
          Icon(
            Icons.arrow_forward,
            color: AppColors.kwhite,
          ),
        ],
      ),
    );
  }
}
