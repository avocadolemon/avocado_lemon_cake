// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatefulWidget {
  final String text, hintText;
  final dynamic value;
  final void Function(dynamic) onChanged;
  final List<DropdownMenuItem<dynamic>>? items;
  const DropDownWidget(
      {Key? key,
      required this.text,
      required this.hintText,
      required this.value,
      required this.onChanged,
       this.items})
      : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 10.0),
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.0.sp,
            ),
          ),
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            hintText: widget.hintText,
            fillColor: Color(0xFFFFFFFF).withOpacity(0.4),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 12.0, 4.0, 12.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0.4),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 0.4),
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          isExpanded: false,
          // dropdownColor: Colors.white,
          elevation: 10,
          value: widget.value,
          onChanged: widget.onChanged,
          items: widget.items,
        )
      ],
    );
  }
}
