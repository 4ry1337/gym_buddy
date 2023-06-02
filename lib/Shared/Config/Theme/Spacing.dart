import 'package:flutter/material.dart';

mixin AppSpacing {
  static const s24 = 24.0;
  static const s16 = 16.0;
  static const s8 = 8.0;
  static const s0 = 0.0;
}

mixin AppPadding {
  static const p24 = EdgeInsets.all(AppSpacing.s24);
  static const p24t = EdgeInsets.only(top: AppSpacing.s24);
  static const p24b = EdgeInsets.only(bottom: AppSpacing.s24);
  static const p24r = EdgeInsets.only(right: AppSpacing.s24);
  static const p24l = EdgeInsets.only(left: AppSpacing.s24);
  static const p24v = EdgeInsets.symmetric(vertical: AppSpacing.s24);
  static const p24h = EdgeInsets.symmetric(horizontal: AppSpacing.s24);
  static const p16 = EdgeInsets.all(AppSpacing.s16);
  static const p16t = EdgeInsets.only(top: AppSpacing.s16);
  static const p16b = EdgeInsets.only(bottom: AppSpacing.s16);
  static const p16r = EdgeInsets.only(right: AppSpacing.s16);
  static const p16l = EdgeInsets.only(left: AppSpacing.s16);
  static const p16v = EdgeInsets.symmetric(vertical: AppSpacing.s16);
  static const p16h = EdgeInsets.symmetric(horizontal: AppSpacing.s16);
  static const p8 = EdgeInsets.all(AppSpacing.s8);
  static const p8t = EdgeInsets.only(top: AppSpacing.s8);
  static const p8b = EdgeInsets.only(bottom: AppSpacing.s8);
  static const p8r = EdgeInsets.only(right: AppSpacing.s8);
  static const p8l = EdgeInsets.only(left: AppSpacing.s8);
  static const p8v = EdgeInsets.symmetric(vertical: AppSpacing.s8);
  static const p8h = EdgeInsets.symmetric(horizontal: AppSpacing.s8);
  static const p0 = EdgeInsets.all(AppSpacing.s0);
  static const p0t = EdgeInsets.only(top: AppSpacing.s0);
  static const p0b = EdgeInsets.only(bottom: AppSpacing.s0);
  static const p0r = EdgeInsets.only(right: AppSpacing.s0);
  static const p0l = EdgeInsets.only(left: AppSpacing.s0);
  static const p0v = EdgeInsets.symmetric(vertical: AppSpacing.s0);
  static const p0h = EdgeInsets.symmetric(horizontal: AppSpacing.s0);
}

mixin AppBorderRadius {
  static final br24 = BorderRadius.circular(AppSpacing.s24);
  static final br16 = BorderRadius.circular(AppSpacing.s16);
  static final br8 = BorderRadius.circular(AppSpacing.s8);
}