// ignore_for_file: prefer_const_constructors

import 'package:avocado_lemon_cake/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import '../../utils/app_textstyle.dart';
import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/textformfield_widget.dart';
import 'package:dotted_border/dotted_border.dart';

class EditNewGroup extends StatefulWidget {
  const EditNewGroup({Key? key}) : super(key: key);

  @override
  State<EditNewGroup> createState() => _EditNewGroupState();
}

List items = ["Surfer", "Blah blah", "Hmmm"];

class _EditNewGroupState extends State<EditNewGroup> {
  bool enableBtn = false;
  bool startLoading = false;
  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController aboutUsController = TextEditingController();
  final TextEditingController freqController = TextEditingController();
  final TextEditingController betwController = TextEditingController();
  final TextEditingController whereController = TextEditingController();
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
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: bodyNormalText(context)
                          .copyWith(color: AppColors.kwhite, fontSize: 16),
                    )),
                Row(children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/groupConversation');
                    },
                    icon: Icon(Icons.notification_important_outlined),
                      color: AppColors.kprimary),
                  kSmallHorizontalSpacing,
                  Icon(Icons.star_border, color: AppColors.kprimary)
                ]),
                TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/editNewGroup');
                    },
                    child: Text(
                      "New Group",
                      style: bodyNormalText(context)
                          .copyWith(color: AppColors.kprimary, fontSize: 18),
                    ))
              ],
            ),
          ),
          kMediumVerticalSpacing,
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Hatikva Neighbourhood",
                          style: heading1(context).copyWith(
                              color: AppColors.kwhite, fontSize: 20))),
                  kLargeVerticalSpacing,
                  Form(
                      child: Column(
                    children: [
                      DropDownWidget(
                        hintText: "Surfer",
                        text: "Sub community",
                        value: "",
                        onChanged: (value) {},
                      ),
                      kLargeVerticalSpacing,
                      TextFormFieldWidget(
                        controller: groupNameController,
                        text: "Group Name",
                        validator: (String? value) {
                          if (value == "") {
                            return "Please fill field";
                          } else {
                            return "";
                          }
                        },
                      ),
                      kLargeVerticalSpacing,
                      TextFormFieldWidget(
                        controller: groupNameController,
                        text: "About us & Age",
                        validator: (String? value) {
                          if (value == "") {
                            return "Please fill field";
                          } else {
                            return "";
                          }
                        },
                        maxLines: 4,
                      ),
                      kLargeVerticalSpacing,
                      TextFormFieldWidget(
                        controller: betwController,
                        text: "Frequency",
                        validator: (String? value) {
                          if (value == "") {
                            return "Please fill field";
                          } else {
                            return "";
                          }
                        },
                      ),
                      kLargeVerticalSpacing,
                      TextFormFieldWidget(
                        controller: betwController,
                        text:
                            "Between Amateure & Prolevelwhether its casual or serious",
                        maxLines: 4,
                        validator: (String? value) {
                          if (value == "") {
                            return "Please fill field";
                          } else {
                            return "";
                          }
                        },
                      ),
                      kLargeVerticalSpacing,
                      TextFormFieldWidget(
                        controller: betwController,
                        text: "Where and when are you meeting",
                        maxLines: 4,
                        validator: (String? value) {
                          if (value == "") {
                            return "Please fill field";
                          } else {
                            return "";
                          }
                        },
                      ),
                    ],
                  )),
                  kLargeVerticalSpacing,
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                backgroundColor: AppColors.kblack,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Image Source", style: heading1(context).copyWith(fontSize: 20, color: AppColors.kwhite)),
                                    kSmallVerticalSpacing,
                                    Text(
                                      "Select where you want to get the image from",
                                      style: bodyTinyText(context)
                                          .copyWith(color: AppColors.kwhite),
                                    ),
                                    kMediumVerticalSpacing,
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.ksgrey,
                                        borderRadius: BorderRadius.circular(kPad + 10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: TextButton(
                                            onPressed: (){}, child: Text("Camera", style: bodyNormalText(context).copyWith(color: AppColors.kwhite),)),
                                        ),
                                        InkWell(
                                          onTap: (){},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                                            decoration: BoxDecoration(
                                              color: AppColors.kprimary,
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Text("Gallery", style: bodyNormalText(context).copyWith(color: AppColors.kwhite),)),
                                        ),
                                      ],),
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        dashPattern: [5, 5],
                        color: AppColors.kwhite.withOpacity(0.8),
                        strokeWidth: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                color: AppColors.kwhite,
                              ),
                              kSmallHorizontalSpacing,
                              Text(
                                "Upload Main Pictures",
                                style: bodyNormalText(context).copyWith(
                                    color: AppColors.kwhite.withOpacity(0.8)),
                              )
                            ],
                          ),
                        )),
                  ),
                  kLargeVerticalSpacing,
                  DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      dashPattern: [5, 5],
                      color: AppColors.kwhite.withOpacity(0.8),
                      strokeWidth: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.contact_page_sharp,
                              color: AppColors.kwhite,
                            ),
                            kSmallHorizontalSpacing,
                            Text(
                              "Add Friends",
                              style: bodyNormalText(context).copyWith(
                                  color: AppColors.kwhite.withOpacity(0.8)),
                            )
                          ],
                        ),
                      )),
                  kLargeVerticalSpacing,
                  kLargeVerticalSpacing,
                  ButtonWidget(
                      enabtn: enableBtn,
                      startLoad: enableBtn,
                      btnName: "Create",
                      onPressed: () {}),
                  kLargeVerticalSpacing,
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
