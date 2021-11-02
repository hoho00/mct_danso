import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningTestScreen extends StatelessWidget {
  MainDansoLearningTestScreen({Key key}) : super(key: key);

  // final SoundController soundController = Get.put(SoundController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '단계별 연습', tabbar: null, enableTabBar: false),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(basicPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftLightCicleAvatarAndText(),
              SizedBox(height: 31.h),
              GetBuilder<DansoSoundLearningController>(
                  init: DansoSoundLearningController(),
                  builder: (controller) {
                    return Container(
                      // color: Colors.lightGreenAccent,
                      height: 420.h,
                      child: Row(
                        children: [
                          dansoImage(controller),
                          listeningAndTest(controller)
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Expanded listeningAndTest(DansoSoundLearningController controller) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 30.w,
              child: Text(controller.listenTunungState
                  ? '소리를 들어보세요'
                  : controller.soundTuningState
                      ? '단소를 불어보세요'
                      : ''),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 97.w,
                  width: 97.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Center(
                      child: Text(
                    '${controller.soundList1[controller.soundListUpDown]}',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(height: 21.h),
                Text(controller.soundList[controller.soundListUpDown],
                    style: TextStyle(fontSize: textStyleSize.sp)),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UpDownButton(
                      icons: Icons.arrow_upward,
                      onPressed: () {
                        controller.listenTunungState
                            ? null
                            : controller.soundTuningState
                                ? null
                                : controller.soundListUp();
                      },
                    ),
                    SizedBox(width: 12.w),
                    UpDownButton(
                      icons: Icons.arrow_downward,
                      onPressed: () {
                        controller.listenTunungState
                            ? null
                            : controller.soundTuningState
                                ? null
                                : controller.soundListDown();
                      },
                    ),
                  ],
                ),
                SoundButton(
                  title: '${controller.buttonSound}',
                  onPressed: controller.listenTunungState
                      ? null
                      : () {
                          controller.changeSoundTuningState();
                          controller.soundListTa(4);
                        },
                ),
                SoundButton(
                  title: '${controller.buttonListen}',
                  onPressed: controller.soundTuningState
                      ? null
                      : () {
                          controller.changeSpeakTuningState();
                        },
                ),
                SoundButton(
                  title: '연습하기',
                  onPressed: controller.listenTunungState
                      ? null
                      : controller.soundTuningState
                          ? null
                          : () {
                              Get.to(MainDansoLearningLevelScreen());
                            },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded dansoImage(DansoSoundLearningController controller) {
    return Expanded(
      child: Center(
        child: Container(
          width: 47.w,
          height: 420.h,
          color: Colors.brown,
          child: Center(child: Text('단소 이미지${controller.soundListUpDown} 변경')),
        ),
      ),
    );
  }

  Row leftLightCicleAvatarAndText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(radius: 14, backgroundColor: Colors.black),
        SizedBox(
          width: 7.sp,
        ),
        Text('왼손'),
        SizedBox(
          width: 7.sp,
        ),
        CircleAvatar(radius: 14, backgroundColor: Colors.grey),
        SizedBox(width: 7.sp),
        Text('오른손'),
      ],
    );
  }
}

class SoundButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const SoundButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(130.w, 45.h),
        ),
      ),
    );
  }
}

class UpDownButton extends StatelessWidget {
  final IconData icons;
  final Function() onPressed;
  const UpDownButton({
    Key key,
    @required this.icons,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icons),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(59.w, 35.h),
      ),
    );
  }
}