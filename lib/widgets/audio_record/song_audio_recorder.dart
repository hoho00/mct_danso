import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungganboController controller;
  final songId;

  SongAudioRecorder({Key? key, required this.controller, required this.songId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  AudioRecordController audioRecordController =
      Get.put(AudioRecordController());
  IndexManager indexManager = IndexManager();
  @override
  void dispose() {
    if (audioRecordController.isRecording == true) {
      audioRecordController.stopRecording(
          songId: widget.songId, exerType: 'audio');
      widget.controller.allMidiStop();
      indexManager.stopIndex();
      widget.controller.jandanStop();
    }

    if (audioRecordController.isRecording == false) {
      audioRecordController.getBack();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioRecordController>(
      init: audioRecordController,
      builder: (audioController) {
        return Row(
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
                  audioRecordController.isRecordingState();
                  widget.controller.changeStartStopState();
                  if (widget.controller.startStopState) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor:
                              MctColor.white.getMctColor.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget()),
                      barrierDismissible: false,
                    );
                    widget.controller.isLevelPracticeState();
                    audioRecordController.startRecording();
                    widget.controller.jandanPlay();
                    widget.controller.stepStart();
                    // widget.controller.playJungGanBo(indexManager);
                    // widget.controller.audioSessionConfigure();
                  }
                  if (!widget.controller.startStopState) {
                    widget.controller.jandanStop();
                    audioRecordController.stopRecording(
                        songId: widget.songId, exerType: 'audio');
                    widget.controller.stepStop();
                    widget.controller.isLevelPracticeState();
                    indexManager.stopIndex();
                  }
                },
                child: audioRecordController.buttonText,
              ),
            ),
          ],
        );
      },
    );
  }
}
