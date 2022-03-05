import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? secure, readOnly;
  final IconData? suffixIcon;
  final String? hintText, text;
  final int? maxLength, maxLines;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.text,
      required this.validator,
      this.icon,
      this.keyboardType,
      this.secure,
      this.hintText,
      this.suffixIcon,
      this.textInputAction,
      this.style,
      this.maxLength,
      this.maxLines,
      this.readOnly,
      this.onTap,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 10.0),
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.0.sp,
            ),
          ),
        ),
        TextFormField(
          // cursorColor: SizachColors.kprimary,
          keyboardType: keyboardType,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction,
          controller: controller,
          inputFormatters: inputFormatters,
          textCapitalization: TextCapitalization.sentences,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          obscureText: secure ?? false,
          obscuringCharacter: '●',
          style: style ?? const TextStyle(color: Colors.black),
          onTap: onTap,
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            suffixIcon: icon ?? Icon(suffixIcon, color: Colors.grey),
            contentPadding: const EdgeInsets.only(left: 10.0, right: 0.0),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15.0.sp,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            filled: true,
            fillColor: Color(0xFFFFFFFF).withOpacity(0.4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0.4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0.4),
            ),
          ),
        ),
      ],
    );
  }
}
