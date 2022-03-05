import 'package:flutter/material.dart';
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
                color: AppColors.kprimary, strokeWidth: 2.8)
            : Text(
                btnName,
                style: const TextStyle(
                    color: AppColors.kblack, fontWeight: FontWeight.w800),
              ),
        color: enabtn ? AppColors.kprimary : AppColors.kprimaryTrans,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
