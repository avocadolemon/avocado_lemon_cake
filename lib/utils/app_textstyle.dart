import 'package:avocado_lemon_cake/utils/colors.dart';
import 'package:flutter/material.dart';

import 'app_responsiveness.dart';

/// App TextStyles
TextStyle heading1(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive18(context),
      fontWeight: FontWeight.bold,
    );

TextStyle heading2(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive16(context),
      fontWeight: FontWeight.w500,
    );

TextStyle heading3(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive24(context),
      fontWeight: FontWeight.w400,
    );

TextStyle bodyNormalText(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive14(context),
      fontWeight: FontWeight.w400,
    );

TextStyle bodySmallText(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive12(context),
    );

TextStyle bodyTinyText(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive10(context),
      fontWeight: FontWeight.w400,
    );

TextStyle labelText(BuildContext context) => TextStyle(
      color: AppColors.kblack,
      fontSize: responsive18(context),
      fontWeight: FontWeight.w400,
    );

TextStyle planlistText(BuildContext context) => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.kblack,
    );