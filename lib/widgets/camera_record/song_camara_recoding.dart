import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/camera_record/camera_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongCamaraRecoding extends StatefulWidget {
  final PlayAndTestController controller;
  SongCamaraRecoding({Key key, this.controller}) : super(key: key);

  @override
  _SongCamaraRecodingState createState() => _SongCamaraRecodingState();
}

class _SongCamaraRecodingState extends State<SongCamaraRecoding> {
  final cameraRecordcontroller = Get.put(CameraRecordController());

  // @override
  // void initState() {
  //   _controller =
  //       CameraController(cameras[_cameraIndex], ResolutionPreset.medium);
  //   _initializeControllerFuture = _controller.initialize();

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  Widget _buildCamera({CameraRecordController caController}) {
    if (cameraRecordcontroller.controller == null ||
        !cameraRecordcontroller.controller.value.isInitialized) {
      return Center(child: Text('Loading...'));
    } else {
      return Container(
        height: 68.h,
        width: 111.w,
        child: Center(
          child: AspectRatio(
            // aspectRatio: cameraRecordcontroller.controller.value.aspectRatio,
            aspectRatio: 4 / 5,
            child: CameraPreview(cameraRecordcontroller.controller),
          ),
        ),
      );
    }
  }

  Widget _buildControls({CameraRecordController caController}) {
    return Row(
      children: <Widget>[
        ElevatedButton(
          child: caController.isRecording ? Text('녹화중지') : Text('녹화시작'),
          onPressed: caController.isRecording
              ? caController.onStop
              : caController.onRecord,
        ),
        SizedBox(width: 5),
        ElevatedButton(
          child: Text('반주만'),
          onPressed: () {},
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