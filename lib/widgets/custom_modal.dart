import 'package:flutter/material.dart';

class CustomModal {
  static void showModal({context, Widget? childWidget}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.only(
            topLeft:  Radius.circular(40.0),
            topRight:  Radius.circular(40.0),
          ),
        ),
        child: childWidget
      ),
    );
    // showBarModalBottomSheet(
    //   backgroundColor: Colors.white,
    //   isDismissible: false,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    //   ),
    //   // barrierColor: Colors.black.withOpacity(.6),
    //   duration: const Duration(milliseconds: 100),
    //   context: context,
    //   builder: (context) => SizedBox(
    //     height: MediaQuery.of(context).size.height*0.5,
    //     child: childWidget,
    //   ),
    // );
  }
}
