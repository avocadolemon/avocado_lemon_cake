import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../utils/colors.dart';

class CustomModal{
   static void showModal({context, Widget? childWidget}) {
    showBarModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      // barrierColor: Colors.black.withOpacity(.6),
      duration: const Duration(milliseconds: 100),
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height*0.5,
        child: childWidget,
      ),
    );
  }
}