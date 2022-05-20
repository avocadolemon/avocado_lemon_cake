// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/screens/add/components/city_block.dart';
import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../core/model/city_model.dart';

class AddCity extends StatefulWidget {
  const AddCity({ Key? key }) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  late int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAPpBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.ksgrey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListTile(
                leading: Icon(Icons.search,),
                title: Text("Search for your city", style: bodyNormalText(context).copyWith(color: AppColors.kwhite),),
              ),
            ),
            kSmallVerticalSpacing,
            Expanded(child: ListView.builder(
              itemCount: cityList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_, index){
              return InkWell(
                onTap: (){
                  setState(() {
                    _selected = index;
                  });
                  Navigator.pushNamed(context, '/add-community');
                  
                },
                child: CityBlock(image: cityList[index].image, city: cityList[index].cityName, subCity: cityList[index].citySubName, selectedCity: _selected, index: index,));
            })),        
          ],
        ),
      ),
    );
  }

  AppBar buildAPpBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text("Select Your City", style: heading1(context).copyWith(color: AppColors.kwhite)),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: 20),
      //     child: Container(
      //       padding: EdgeInsets.all(6),
      //       decoration: BoxDecoration(
      //         color: AppColors.ksgrey,
      //         shape: BoxShape.circle,
      //       ),
      //       child: Icon(Icons.location_city, color: AppColors.kwhite, size: 14,)
      //       // child: ,
      //     ),
      //   )
      // ],
    );
  }
}

