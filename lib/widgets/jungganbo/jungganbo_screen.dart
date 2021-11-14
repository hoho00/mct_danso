import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jungganbo_controller.dart';

Widget jungganboScreen(int heightNumber, JungganboController controller) {
  double height = heightNumber == 12
      ? jungHeight
      : heightNumber == 8
          ? jungEightHeight
          : jungSixHeight;

  return Row(
    children: [
      for (var c = 3; c >= 0; c--)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
              Row(
                children: [
                  jungBigContainer(height, controller),
                  jungBlankContainer(height),
                ],
              ),
          ],
        ),
    ],
  );
}

Container jungBlankContainer(
  double height,
) {
  return Container(
    width: 20.w,
    height: height.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
  );
}

Widget jungBigContainer(double height, controller) {
  return InkWell(
    onTap: () {
      controller.changegameState();
    },
    child: Container(
      width: jungWidth.w,
      height: height.h,
      decoration: BoxDecoration(border: Border.all(color: textBlack)),
    ),
  );
}
