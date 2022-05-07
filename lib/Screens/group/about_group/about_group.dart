import 'dart:ffi';

import 'package:avocado_lemon_cake/Screens/group/about_group/components/group_details.dart';
import 'package:avocado_lemon_cake/widgets/more_button.dart';
import 'package:avocado_lemon_cake/Screens/group/about_group/components/profiles_avater.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/more_button.dart';
import 'components/groupID_image_slider.dart';

class AboutGroup extends StatefulWidget {
  const AboutGroup({Key? key}) : super(key: key);

  @override
  State<AboutGroup> createState() => _AboutGroupState();
}

class _AboutGroupState extends State<AboutGroup> {
  @override
  Widget build(BuildContext context) {
    String groupID = 'Group Name (12) ID';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          groupID,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _showDialogBox(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: const MoreButton(),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Community, Neighborhood- Sub Community',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color.fromARGB(255, 148, 148, 148),
                ),
              ),
            ),
            const GroupIdImageSlider(),
            SizedBox(
              height: 10.h,
            ),
            const GroupDetails(),
            const ProfileList(),
            SizedBox(
              height: 10.h,
            ),
            // buttom button
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                    color: const Color(0xffFFCC00),
                    borderRadius: BorderRadius.circular(25.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      'Traveling With kids (60)',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16.sp),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// function to display a dialog box of the group id

_showDialogBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const SimpleDialog(
        children: <Widget>[
          DialogOptions(
            title: 'ID of the Sling (10)',
            titleColor: Color(0xff8dd812),
            backColor: Colors.black,
          ),
          DialogOptions(
            title: 'Send Message / Join',
            titleColor: Color(0xffFFCC00),
          ),
          DialogOptions(
            title: 'Share Group',
            titleColor: Color(0xffFFCC00),
          ),
          DialogOptions(
            title: 'Report a Group',
            titleColor: Color(0xff534B4B),
          ),
          DialogOptions(
            title: 'Cancel',
          )
        ],
      );
    },
  );
}

class DialogOptions extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? backColor;
  final Void? onpress;
  const DialogOptions({
    Key? key,
    required this.title,
    this.titleColor,
    this.backColor = Colors.black,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: Container(
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(20.h)),
        height: 35.h,
        width: 210.w,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: titleColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
