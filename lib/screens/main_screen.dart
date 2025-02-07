import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';
// import 'package:just_audio/just_audio.dart';
// testasdf

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenController mainScreenController =
      Get.put(MainScreenController(), permanent: true);

  TearController tearController = Get.put(TearController(), permanent: true);

  @override
  void initState() {
    super.initState();
    tearController.getTearInfo();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mainScreenController.assetsAudioPlayer.dispose();
    tearController.getTearInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('한번 더 누르면 앱이 종료됩니다.'),
        ),
        child: GetBuilder<MainScreenController>(
            init: MainScreenController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: [
                          headerImage(controller),
                          bgmOnOffButton(onPressed: () {
                            controller.playOrPause();
                            controller.ChangeMuteButtonState();
                          }),
                          tearImage(),
                          headerChangeButton(controller),
                          myPageButton(),
                        ],
                      ),
                    ),
                    _homeMenuButton(
                        assetName: INFOR_SVG,
                        title: '단소 알아보기',
                        contant: LOOK,
                        page: MainDansoHistoryKindScreen()),
                    _homeMenuButton(
                        assetName: DANSO_TUNING_SVG,
                        title: '내 단소 기준음 잡기',
                        contant: VOLUMECONTROL,
                        page: FixDansoPitchDialog(),
                        dialog: true),
                    _homeMenuButton(
                        assetName: STUDY_SVG,
                        title: '운지법 익히기',
                        page: learningDialog(),
                        contant: LEARN,
                        svgHeight: 60,
                        svgWidth: 60,
                        dialog: true),
                    _homeMenuButton(
                        assetName: TUNE_SVG,
                        title: '연주곡 익히기',
                        contant: PLAYLEARN,
                        svgHeight: 65,
                        svgWidth: 65,
                        page: LearningSongListScreen()),
                    _homeMenuButton(
                        assetName: QandA_SVG,
                        title: 'Q&A와 팁',
                        contant: QUESTIONS,
                        svgHeight: 60,
                        svgWidth: 60,
                        page: QuestionsScreen()),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget tearImage() {
    return Positioned(
      top: 40.h,
      right: 10.w,
      child: SvgPicture.asset(
        tearController.emblemAsset,
        width: 30.w,
        height: 30.w,
      ),
    );
  }

  Widget bgmOnOffButton({Function()? onPressed}) {
    return Positioned(
      top: 40.h,
      left: 10.w,
      child: Container(
          width: 85.w,
          height: 22.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: MctColor.lightYellow.getMctColor.withOpacity(0),
                  side: BorderSide(color: MctColor.white.getMctColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  !mainScreenController.musicState
                      ? SvgPicture.asset(
                          OFF_SVG,
                          width: 10.w,
                          height: 10.h,
                        )
                      : SvgPicture.asset(
                          ON_SVG,
                          width: 10.w,
                          height: 10.h,
                        ),
                  Text(
                    '배경음',
                    style: TextStyle(fontSize: 10.sp, fontFamily: NOTO_REGULAR),
                  ),
                ],
              ))),
    );
  }

  Widget headerChangeButton(MainScreenController controller) {
    return Positioned(
        top: 85.w,
        left: 50.w,
        child: Container(
          width: 100.w,
          height: 100.h,
          child: InkWell(
            enableFeedback: false,
            onTap: () {
              controller.SvgStateChange();
            },
            child: Text(
              '',
              style: TextStyle(color: MctColor.black.getMctColor),
            ),
          ),
        ));
  }

  Widget headerImage(MainScreenController controller) {
    return Container(
        child: controller.svgState
            ? SvgPicture.asset(
                MAIN_ILL2_SVG,
                fit: BoxFit.fitWidth,
                width: ScreenUtil().screenWidth,
              )
            : SvgPicture.asset(
                MAIN_ILL1_SVG,
                fit: BoxFit.fitWidth,
                width: ScreenUtil().screenWidth,
              ));
  }

  Positioned myPageButton() {
    return Positioned.fill(
      bottom: 28.w,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          // onTap: () => Get.to(MyPageScreen()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPageScreen()),
            ).then((value) => setState(() {}));
          },
          child: Container(
            width: 174.w,
            height: 36.w,
            decoration: BoxDecoration(
                color: MctColor.lightYellow.getMctColor,
                borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                '마이페이지',
                style: TextStyle(
                    color: MctColor.white.getMctColor,
                    fontFamily: NOTO_MEDIUM,
                    fontSize: MctSize.fifteen.getSize.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeMenuButton(
      {required String title,
      required Widget page,
      required List contant,
      required String assetName,
      double svgHeight = 45,
      double svgWidth = 45,
      bool dialog = false,
      Function()? onPressed}) {
    return InkWell(
        onTap: () {
          var controller = Get.find<MainScreenController>();
          if (controller.musicState) {
            // 아예 정지
            // Get.find<MainScreenController>().disposeAudioPlayer();
            // 일시 정지
            controller.assetsAudioPlayer.pause();
          }
          onPressed;
          if (dialog) {
            Get.dialog(page);
          } else {
            Get.to(page);
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
          height: 106.w,
          // width: 330.w,
          decoration: BoxDecoration(
              color: MctColor.white.getMctColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 103.w,
                child: SvgPicture.asset(
                  assetName,
                  width: svgWidth.w,
                  height: svgHeight.w,
                ),
              ),
              // SizedBox(width: 14.w),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title',
                        style: TextStyle(
                            fontSize: MctSize.twenty.getSize.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: NOTO_BOLD)),
                    SizedBox(height: 7.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Text(contant[i],
                              style: TextStyle(
                                  fontSize: 14.sp, fontFamily: NOTO_REGULAR)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
