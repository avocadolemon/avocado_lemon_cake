import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final bool enabtn, startLoad;
  final String btnName;
  final void Function() onPressed;
  const ButtonWidget(
      {Key? key,
      required this.enabtn,
      required this.startLoad,
      required this.btnName,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: MaterialButton(
        onPressed: enabtn ? onPressed : null,
        disabledColor: AppColors.kprimaryTrans,
        elevation: 0,
        child: startLoad
            ? const CircularProgressIndicator(
                color: AppColors.kblack, strokeWidth: 2.8)
            : Text(
                btnName,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.kblack,
                    fontWeight: FontWeight.w700),
              ),
        color: enabtn ? AppColors.kprimary : AppColors.kprimaryTrans,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
