import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupIdImageSlider extends StatelessWidget {
  const GroupIdImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String groupImg = 'assets/images/unsplash_HgoKvtKpyHA.png';

    return SizedBox(
      height: 194.h,
      width: 360.w,
      child: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 25.h),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(groupImg,), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
