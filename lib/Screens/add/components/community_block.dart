// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_textstyle.dart';
import '../../../utils/colors.dart';

class CommunityBlock extends StatefulWidget {
  final String image;
  final String city;
  final String subCity;
  final bool selected;
  const CommunityBlock({
    Key? key,
    required this.selected,
    required this.image,
    required this.city,
    required this.subCity,
  }) : super(key: key);

  @override
  State<CommunityBlock> createState() => _CommunityBlockState();
}

class _CommunityBlockState extends State<CommunityBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(widget.selected == true ? 4 : 8),
                    decoration: BoxDecoration(
                        color: widget.selected == true
                            ? AppColors.kprimary
                            : Colors.transparent,
                        border: Border.all(
                          color: widget.selected == true
                              ? AppColors.kprimary
                              : AppColors.kwhite,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: widget.selected == true
                        ? Icon(
                            Icons.check,
                            color: AppColors.kblack,
                            size: 10,
                          )
                        : Container(),
                  ),
                  kSmallVerticalSpacing,
                  Text(
                    widget.city,
                    style: bodyNormalText(context)
                        .copyWith(color: AppColors.kwhite),
                  ),
                  Text(
                    widget.subCity,
                    style: bodyTinyText(context)
                        .copyWith(color: AppColors.kwhite, fontSize: 10),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
