import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongCamaraRecoding extends StatefulWidget {
  final JungganboController controller;
  final songId;
  final String jangdan;
  SongCamaraRecoding(
      {Key? key,
      required this.controller,
      required this.jangdan,
      required this.songId})
      : super(key: key);

  @override
  _SongCamaraRecodingState createState() => _SongCamaraRecodingState();
}

class _SongCamaraRecodingState extends State<SongCamaraRecoding> {
  final cameraRecordcontroller = Get.put(CameraRecordController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());

  @override
  void dispose() {
    if (cameraRecordcontroller.isRecording) {
      cameraRecordcontroller.onStop(songId: widget.songId);
      // widget.controller.allMidiStop();
      jangdanAndDansoSoundController.jandanStop();
    }

    if (cameraRecordcontroller.isRecording == false) {
      cameraRecordcontroller.getBack();
    }
    super.dispose();
  }

  Widget _buildCamera({required CameraRecordController caController}) {
    if (cameraRecordcontroller.controller == null ||
        !cameraRecordcontroller.controller.value.isInitialized) {
      return Center(child: Text('Loading...'));
    } else {
      return Container(
        height: 50.h,
        width: 111.w,
        child: Center(
          child: AspectRatio(
            // aspectRatio: cameraRecordcontroller.controller.value.aspectRatio,
            aspectRatio: 6 / 4,
            child: CameraPreview(cameraRecordcontroller.controller),
          ),
        ),
      );
    }
  }

  Widget _buildControls({required CameraRecordController caController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: <Widget>[
            Container(
              width: 81.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: MctColor.white.getMctColor,
                    onPrimary: MctColor.buttonColorOrange.getMctColor,
                    side: BorderSide(
                        color: MctColor.buttonColorOrange.getMctColor),
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: MctColor.buttonColorOrange.getMctColor)),
                onPressed: () async {
                  caController.isRecordingState();
                  widget.controller.changeStartStopState();
                  jangdanAndDansoSoundController.setJandan(widget.jangdan);

                  if (caController.isRecording) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor:
                              MctColor.white.getMctColor.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget(
                            timer: widget.controller.micro,
                          )),
                      barrierDismissible: false,
                    );
                    await caController.onRecord();
                    jangdanAndDansoSoundController.jandanPlay();
                    widget.controller.stepStart();
                    widget.controller.isLevelPracticeState();
                  }
                  if (caController.isRecording == false) {
                    await caController.onStop(songId: widget.songId);
                    jangdanAndDansoSoundController.jandanStop();
                    widget.controller.isLevelPracticeState();
                    caController.getBack();
                    widget.controller.stepStop();
                  }
                },
                child: Text(caController.recordingText,
                    style: TextStyle(fontSize: MctSize.twelve.getSize.sp)),
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          widget.jangdan,
          style: TextStyle(fontSize: MctSize.twelve.getSize.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraRecordController>(
        init: cameraRecordcontroller,
        builder: (caController) {
          return FutureBuilder(
              future: caController.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    children: [
                      _buildCamera(caController: caController),
                      Spacer(flex: 1),
                      _buildControls(caController: caController),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              });
        });
  }
}
