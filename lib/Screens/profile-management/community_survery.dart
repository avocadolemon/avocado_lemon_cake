import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunitySurvey extends StatefulWidget {
  const CommunitySurvey({Key? key}) : super(key: key);

  @override
  State<CommunitySurvey> createState() => _CommunitySurveyState();
}

class _CommunitySurveyState extends State<CommunitySurvey> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Community Surveys')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 42.h),
            Container(
              height: 194.h,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage('assets/imgs/running.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 45.h),
            Text(
              'Beyond Community Survey',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 13.h),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit placerat sit dolor, amet, eu, suspendisse lectus non. Scelerisque egestas montes, posuere libero nullam aliquet quis. Pellentesque phasellus volutpat egestas semper mauris, tristique ornare. Elit, netus risus, et non aliquam odio.',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
