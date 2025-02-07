import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/date_format.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageLook extends StatefulWidget {
  final String songname;
  final String date;

  MyPageLook({Key? key, required this.songname, required this.date})
      : super(key: key);

  @override
  State<MyPageLook> createState() => _MyPageLookState();
}

class _MyPageLookState extends State<MyPageLook> {
  final audioAndVideoListController = Get.put(AudioAndVideoListController());
  @override
  void initState() {
    audioAndVideoListController.onInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주보기', tabbar: null, enableTabBar: false),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(MctSize.fifteen.getSize),
          reverse: true,
          shrinkWrap: true,
          itemCount: audioAndVideoListController.videoList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = audioAndVideoListController.videoList[index];
            if (audioAndVideoListController.videoList.isNotEmpty) {
              print('${item.exerPath}');
              return Padding(
                padding: EdgeInsets.only(bottom: MctSize.fifteen.getSize),
                child: InkWell(
                  onTap: () async {
                    var dir = (await getApplicationDocumentsDirectory()).path;
                    await Get.to(VideoApp(
                      videoFilePath: Platform.isIOS
                          ? '$dir/camera/videos/${item.exerPath}'
                          : item.exerPath,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MctColor.buttonColorYellow.getMctColor),
                    height: 60.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MctSize.fifteen.getSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.songTitle}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: MctSize.eighteen.getSize.sp,
                                    color: MctColor.white.getMctColor,
                                    fontFamily: NOTO_MEDIUM),
                              ),
                              SizedBox(height: 2),
                              Text(
                                convertDateFormat(item.exerTime),
                                style: TextStyle(
                                    color: MctColor.white.getMctColor),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
                        PopupMenuButton(
                          onSelected: (value) async {
                            if (value == 1) {
                              audioAndVideoListController
                                  .shareFile(item.exerPath);
                            }
                            if (value == 2) {
                              var dir =
                                  (await getApplicationDocumentsDirectory())
                                      .path;

                              await Get.dialog(myPageDeleteDialog(
                                  Platform.isIOS
                                      ? '$dir/camera/videos/${item.exerPath}'
                                      : item.exerPath,
                                  item.exerId));
                            }
                          },
                          child: Container(
                              // color: Colors.grey,
                              height: 25.w,
                              width: 40.w,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: SvgPicture.asset(
                                SEE_MORE_SVG,
                                // width: 40.w,
                                // height: 25.h,
                                fit: BoxFit.contain,
                              )),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                '공유하기',
                                style: TextStyle(fontFamily: NOTO_REGULAR),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text(
                                '삭제하기',
                                style: TextStyle(fontFamily: NOTO_REGULAR),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                height: 200.h,
                child: Center(
                  child: Text('없음'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
