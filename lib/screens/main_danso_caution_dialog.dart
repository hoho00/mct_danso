import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/mains/mains.dart';
import 'package:project_danso/widgets/widgets.dart';

class FixDansoPitchDialog extends StatefulWidget {
  const FixDansoPitchDialog({Key? key}) : super(key: key);

  @override
  _FixDansoPitchDialogState createState() => _FixDansoPitchDialogState();
}

class _FixDansoPitchDialogState extends State<FixDansoPitchDialog> {
  var controller = Get.find<MainScreenController>();
  @override
  void dispose() {
    super.dispose();
  }

  var dansoSoundLearningController = Get.put(DansoSoundLearningController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          // height: 260.h,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              precautions(),
              SizedBox(height: 15.h),
              ConfirmOrCancelButton(
                  controller: controller,
                  dansoSoundLearningController: dansoSoundLearningController)
            ],
          ),
        ),
      ),
    );
  }

  Column precautions() {
    return Column(
      children: [
        SvgPicture.asset(
          WARNING_SVG,
          width: 60.w,
          height: 60.h,
          color: MctColor.buttonColorYellow.getMctColor,
        ),
        SizedBox(height: 10.h),
        Text(
          '연주 시 주의사항',
          style: TextStyle(
              fontSize: MctSize.seventeen.getSize.sp,
              fontWeight: bold,
              fontFamily: NOTO_BOLD),
        ),
        SizedBox(height: 10.h),
        Text(
          '단소의 바람이 마이크로 들어가지 않게 해 주세요',
          style: TextStyle(fontFamily: NOTO_REGULAR, fontSize: 13.sp),
        ),
        SizedBox(height: 5.h),
        Text(
          '소음이 적은 장소에서 연주해 주세요',
          style: TextStyle(fontFamily: NOTO_REGULAR, fontSize: 13.sp),
        ),
      ],
    );
  }
}

class ConfirmOrCancelButton extends StatelessWidget {
  const ConfirmOrCancelButton({
    Key? key,
    required this.controller,
    required this.dansoSoundLearningController,
  }) : super(key: key);

  final MainScreenController controller;
  final DansoSoundLearningController dansoSoundLearningController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Get.back();
              if (controller.musicState) {
                controller.assetsAudioPlayer.play();
              }
            },
            child: Container(
              height: 53.h,
              child: Center(
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              Get.back();
              await Get.dialog(
                Dialog(child: TimerWidget()),
                barrierDismissible: false,
              );
              dansoSoundLearningController.startAdjust();
              await Get.dialog(
                Dialog(
                  child: LoadingIndicator(),
                ),
                barrierDismissible: false,
              );
              dansoSoundLearningController.stopAdjust();
            },
            child: Container(
              height: 53.h,
              child: Center(
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget mainDansoCautionDialog() {
//   return 
// }

