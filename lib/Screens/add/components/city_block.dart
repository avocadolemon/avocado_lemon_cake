// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_textstyle.dart';
import '../../../utils/colors.dart';

class CityBlock extends StatefulWidget {
  final String image;
  final String city;
  final String subCity;
  final int selectedCity;
  final int index;
  const CityBlock({
    Key? key, required this.image, required this.city, required this.subCity, required this.selectedCity, required this.index,
  }) : super(key: key);

  @override
  State<CityBlock> createState() => _CityBlockState();
}

class _CityBlockState extends State<CityBlock> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPad),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // ignore: prefer_const_constructors
              image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover)
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:  EdgeInsets.all(widget.selectedCity == widget.index ? 4 : 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  widget.selectedCity == widget.index ?AppColors.kprimary : AppColors.kwhite,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),                      
                child:  widget.selectedCity == widget.index ? CircleAvatar(
                  backgroundColor: AppColors.kprimary,
                  maxRadius: 5,
                ) : Container(),
              ),
              kSmallVerticalSpacing,
              Text(widget.city, style: bodyNormalText(context).copyWith(color: AppColors.kwhite),),
              Text(widget.subCity, style: bodyTinyText(context).copyWith(color: AppColors.kwhite,fontSize: 10),),
            ],
          ))
        ],
      ),
    );
  }
}