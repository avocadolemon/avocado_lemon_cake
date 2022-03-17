import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../core/model/model.dart';
import '../../utils/colors.dart';

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


class AddGroup extends StatelessWidget {
  const AddGroup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel", style: bodyNormalText(context).copyWith(color: AppColors.kwhite, fontSize: 16),)),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/editNewGroup');
                  }, child: Text("New Group", style: bodyNormalText(context).copyWith(color: AppColors.kprimary, fontSize: 18),))
                ],
              ),
            ),
            // kLargeVerticalSpacing,
            Expanded(child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (_, index) {
            return BuildTile(image: list[index].image);
          }),
            
            
            
        )
          ],
        ),
      ),
    );
  }
}

class BuildTile extends StatelessWidget {
  final String image;
  const BuildTile({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading:  CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
        title: Text("Johnson Eve", style: bodySmallText(context).copyWith(color: AppColors.kwhite),),
        subtitle: Text("Lorem ipsum, whyhave you been all this while and i have not been hearing from you", style: bodyTinyText(context).copyWith(color: AppColors.kwhite.withOpacity(0.7), fontSize: 10),),
        trailing: Text("Add", style: bodySmallText(context).copyWith(color: AppColors.kprimary, fontSize: 18),),
      ),
    );
  }
}