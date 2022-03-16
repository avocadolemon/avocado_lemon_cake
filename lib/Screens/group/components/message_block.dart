// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_textstyle.dart';
import '../../../utils/colors.dart';

class MessageBlock extends StatelessWidget {
  final String image;
  const MessageBlock({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical :15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 35,
          ),
          kSmallHorizontalSpacing,
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: kPad + 10, horizontal: kPad),
                    decoration: BoxDecoration(
                        color: AppColors.kprimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )),
                    child: Text(
                      "Sed ligula erat, mauris sit eros a viverra amet dictum id?",
                      style: bodySmallText(context)
                          .copyWith(color: AppColors.kblack),
                    )),
                kTinyVerticalSpacing,
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Text(
                        "17:00",
                        style: bodyTinyText(context).copyWith(
                            color: AppColors.kwhite
                                .withOpacity(0.7)),
                      ),
                      kTinyHorizontalSpacing,
                      Text("|",
                          style: bodyTinyText(context).copyWith(
                              color: AppColors.kwhite
                                  .withOpacity(0.7))),
                      kTinyHorizontalSpacing,
                      Text(
                        "13.05.20",
                        style: bodyTinyText(context).copyWith(
                            color: AppColors.kwhite
                                .withOpacity(0.7)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
