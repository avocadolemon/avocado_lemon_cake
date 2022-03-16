// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_textstyle.dart';
import '../../../utils/colors.dart';

class CityBlock extends StatefulWidget {
  final String image;
  final String city;
  final String subCity;
  const CityBlock({
    Key? key, required this.image, required this.city, required this.subCity,
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
      child: InkWell(
        onTap: (){
          setState(() {
            selected =! selected;
          });
        },
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
                  padding:  EdgeInsets.all(selected == true ? 4 : 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  selected == true ?AppColors.kprimary : AppColors.kwhite,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),                      
                  child:  selected == true ? CircleAvatar(
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
      ),
    );
  }
}